import 'package:firebase_auth/firebase_auth.dart';
import 'exaption_handle.dart';
import 'model.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._();
  static final FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserData> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await firebaseAuth.currentUser!.sendEmailVerification();
      return UserData(
        error: null,
        user: credential.user,
      );
    } catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      return UserData(
        error: AuthExceptionHandler.generateExceptionMessage(status),
        user: null,
      );
    }
  }

  Future<UserData> signInwithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserData(
        error: null,
        user: credential.user,
      );
    } catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      return UserData(
        error: AuthExceptionHandler.generateExceptionMessage(status),
        user: null,
      );
    }
  }
}
