part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginData(String email,password) = _LoginData;
  const factory LoginEvent.signUpData(String email,password) = _SignUpData;
  const factory LoginEvent.googleLogin() = _GoogleLogin;
}