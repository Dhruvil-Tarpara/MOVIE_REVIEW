part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loding(bool isLoding) = _Loding;
  const factory LoginState.success(UserData loginSuccess) = _Success;
  const factory LoginState.error(String massage) = _Error;
}
