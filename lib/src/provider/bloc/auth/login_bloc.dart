import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_review/src/provider/firebase/auth/auth.dart';
import 'package:movie_review/src/provider/firebase/auth/model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<LoginEvent>(
      (event, emit) async {
        if (event is _LoginData) {
          emit(const _Loding(true));
          UserData userData = await FirebaseAuthHelper.firebaseAuthHelper
              .signInwithEmailPassword(
                  email: event.email, password: event.password);
          if (userData.user != null) {
            emit(const _Loding(false));
            emit(_Success(userData));
          } else {
            emit(const _Loding(false));
            emit(_Error(userData.error!));
          }
        } else if (event is _SignUpData) {
          emit(const _Loding(true));
          UserData userData = await FirebaseAuthHelper.firebaseAuthHelper
              .signUpWithEmailPassword(
                  email: event.email, password: event.password);
          if (userData.user != null) {
            emit(const _Loding(false));
            emit(_Success(userData));
          } else {
            emit(const _Loding(false));
            emit(_Error(userData.error!));
          }
        } else if (event is _GoogleLogin) {
          emit(const _Loding(true));
          UserData userData =
              await FirebaseAuthHelper.firebaseAuthHelper.signInWithGoogle();
          if (userData.user != null) {
            emit(const _Loding(false));
            emit(_Success(userData));
          } else {
            emit(const _Loding(false));
            emit(_Error(userData.error!));
          }
        }
      },
    );
  }
}
