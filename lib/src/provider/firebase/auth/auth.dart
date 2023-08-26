import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'exaption_handle.dart';
import 'model.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._();
  static final FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

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
        user: Users.fromDocument(credential.user),
      );
    } on FirebaseAuthException catch (e) {
      print("============");
      print(e.code);
      print("==============");
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
        user: Users.fromDocument(credential.user),
      );
    } catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      return UserData(
        error: AuthExceptionHandler.generateExceptionMessage(status),
        user: null,
      );
    }
  }

  Future<UserData> signInWithGoogle() async {
    try {
      if (Platform.isIOS) {
        googleSignIn = GoogleSignIn(
          clientId:
              "953226139203-m30riok47kqvc3ticpdd64aqslk9mccj.apps.googleusercontent.com",
          scopes: ["email"],
        );
      }
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      return UserData(
        error: null,
        user: Users.fromDocument(userCredential.user),
      );
    } on FirebaseAuthException catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      return UserData(
          error: AuthExceptionHandler.generateExceptionMessage(status),
          user: null);
    }
  }

  Future logout() async {
    try {
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
  }
}
