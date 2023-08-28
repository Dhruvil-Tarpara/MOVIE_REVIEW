part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loding(bool isLoding) = _Loding;
  const factory SignUpState.success(bool isSignUp) = _Success;
  const factory SignUpState.error(String massage) = _Error;
}
