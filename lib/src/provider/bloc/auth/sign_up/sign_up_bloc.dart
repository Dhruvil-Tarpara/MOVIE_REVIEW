import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_review/src/provider/firebase/auth/auth.dart';
import 'package:movie_review/src/provider/firebase/auth/model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const _Initial()) {
    on<SignUpEvent>((event, emit) async {
    if (event is _SignUpData) {
          emit(const _Loding(true));
          UserData userData = await FirebaseAuthHelper.firebaseAuthHelper
              .signUpWithEmailPassword(
                  email: event.email, password: event.password);
          if (userData.user != null) {
            emit(const _Loding(false));
            emit(const _Success(true));
          } else {
            emit(const _Loding(false));
            emit(_Error(userData.error!));
          }
        }
    });
  }
}
