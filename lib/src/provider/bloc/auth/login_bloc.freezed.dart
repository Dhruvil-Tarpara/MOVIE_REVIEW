// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, dynamic password) loginData,
    required TResult Function(String email, dynamic password) signUpData,
    required TResult Function() googleLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, dynamic password)? loginData,
    TResult? Function(String email, dynamic password)? signUpData,
    TResult? Function()? googleLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, dynamic password)? loginData,
    TResult Function(String email, dynamic password)? signUpData,
    TResult Function()? googleLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginData value) loginData,
    required TResult Function(_SignUpData value) signUpData,
    required TResult Function(_GoogleLogin value) googleLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginData value)? loginData,
    TResult? Function(_SignUpData value)? signUpData,
    TResult? Function(_GoogleLogin value)? googleLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginData value)? loginData,
    TResult Function(_SignUpData value)? signUpData,
    TResult Function(_GoogleLogin value)? googleLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoginDataCopyWith<$Res> {
  factory _$$_LoginDataCopyWith(
          _$_LoginData value, $Res Function(_$_LoginData) then) =
      __$$_LoginDataCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, dynamic password});
}

/// @nodoc
class __$$_LoginDataCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_LoginData>
    implements _$$_LoginDataCopyWith<$Res> {
  __$$_LoginDataCopyWithImpl(
      _$_LoginData _value, $Res Function(_$_LoginData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = freezed,
  }) {
    return _then(_$_LoginData(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == password ? _value.password! : password,
    ));
  }
}

/// @nodoc

class _$_LoginData implements _LoginData {
  const _$_LoginData(this.email, this.password);

  @override
  final String email;
  @override
  final dynamic password;

  @override
  String toString() {
    return 'LoginEvent.loginData(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginData &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginDataCopyWith<_$_LoginData> get copyWith =>
      __$$_LoginDataCopyWithImpl<_$_LoginData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, dynamic password) loginData,
    required TResult Function(String email, dynamic password) signUpData,
    required TResult Function() googleLogin,
  }) {
    return loginData(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, dynamic password)? loginData,
    TResult? Function(String email, dynamic password)? signUpData,
    TResult? Function()? googleLogin,
  }) {
    return loginData?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, dynamic password)? loginData,
    TResult Function(String email, dynamic password)? signUpData,
    TResult Function()? googleLogin,
    required TResult orElse(),
  }) {
    if (loginData != null) {
      return loginData(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginData value) loginData,
    required TResult Function(_SignUpData value) signUpData,
    required TResult Function(_GoogleLogin value) googleLogin,
  }) {
    return loginData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginData value)? loginData,
    TResult? Function(_SignUpData value)? signUpData,
    TResult? Function(_GoogleLogin value)? googleLogin,
  }) {
    return loginData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginData value)? loginData,
    TResult Function(_SignUpData value)? signUpData,
    TResult Function(_GoogleLogin value)? googleLogin,
    required TResult orElse(),
  }) {
    if (loginData != null) {
      return loginData(this);
    }
    return orElse();
  }
}

abstract class _LoginData implements LoginEvent {
  const factory _LoginData(final String email, final dynamic password) =
      _$_LoginData;

  String get email;
  dynamic get password;
  @JsonKey(ignore: true)
  _$$_LoginDataCopyWith<_$_LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignUpDataCopyWith<$Res> {
  factory _$$_SignUpDataCopyWith(
          _$_SignUpData value, $Res Function(_$_SignUpData) then) =
      __$$_SignUpDataCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, dynamic password});
}

/// @nodoc
class __$$_SignUpDataCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_SignUpData>
    implements _$$_SignUpDataCopyWith<$Res> {
  __$$_SignUpDataCopyWithImpl(
      _$_SignUpData _value, $Res Function(_$_SignUpData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = freezed,
  }) {
    return _then(_$_SignUpData(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == password ? _value.password! : password,
    ));
  }
}

/// @nodoc

class _$_SignUpData implements _SignUpData {
  const _$_SignUpData(this.email, this.password);

  @override
  final String email;
  @override
  final dynamic password;

  @override
  String toString() {
    return 'LoginEvent.signUpData(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpData &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpDataCopyWith<_$_SignUpData> get copyWith =>
      __$$_SignUpDataCopyWithImpl<_$_SignUpData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, dynamic password) loginData,
    required TResult Function(String email, dynamic password) signUpData,
    required TResult Function() googleLogin,
  }) {
    return signUpData(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, dynamic password)? loginData,
    TResult? Function(String email, dynamic password)? signUpData,
    TResult? Function()? googleLogin,
  }) {
    return signUpData?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, dynamic password)? loginData,
    TResult Function(String email, dynamic password)? signUpData,
    TResult Function()? googleLogin,
    required TResult orElse(),
  }) {
    if (signUpData != null) {
      return signUpData(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginData value) loginData,
    required TResult Function(_SignUpData value) signUpData,
    required TResult Function(_GoogleLogin value) googleLogin,
  }) {
    return signUpData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginData value)? loginData,
    TResult? Function(_SignUpData value)? signUpData,
    TResult? Function(_GoogleLogin value)? googleLogin,
  }) {
    return signUpData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginData value)? loginData,
    TResult Function(_SignUpData value)? signUpData,
    TResult Function(_GoogleLogin value)? googleLogin,
    required TResult orElse(),
  }) {
    if (signUpData != null) {
      return signUpData(this);
    }
    return orElse();
  }
}

abstract class _SignUpData implements LoginEvent {
  const factory _SignUpData(final String email, final dynamic password) =
      _$_SignUpData;

  String get email;
  dynamic get password;
  @JsonKey(ignore: true)
  _$$_SignUpDataCopyWith<_$_SignUpData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GoogleLoginCopyWith<$Res> {
  factory _$$_GoogleLoginCopyWith(
          _$_GoogleLogin value, $Res Function(_$_GoogleLogin) then) =
      __$$_GoogleLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GoogleLoginCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_GoogleLogin>
    implements _$$_GoogleLoginCopyWith<$Res> {
  __$$_GoogleLoginCopyWithImpl(
      _$_GoogleLogin _value, $Res Function(_$_GoogleLogin) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GoogleLogin implements _GoogleLogin {
  const _$_GoogleLogin();

  @override
  String toString() {
    return 'LoginEvent.googleLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GoogleLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, dynamic password) loginData,
    required TResult Function(String email, dynamic password) signUpData,
    required TResult Function() googleLogin,
  }) {
    return googleLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, dynamic password)? loginData,
    TResult? Function(String email, dynamic password)? signUpData,
    TResult? Function()? googleLogin,
  }) {
    return googleLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, dynamic password)? loginData,
    TResult Function(String email, dynamic password)? signUpData,
    TResult Function()? googleLogin,
    required TResult orElse(),
  }) {
    if (googleLogin != null) {
      return googleLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginData value) loginData,
    required TResult Function(_SignUpData value) signUpData,
    required TResult Function(_GoogleLogin value) googleLogin,
  }) {
    return googleLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginData value)? loginData,
    TResult? Function(_SignUpData value)? signUpData,
    TResult? Function(_GoogleLogin value)? googleLogin,
  }) {
    return googleLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginData value)? loginData,
    TResult Function(_SignUpData value)? signUpData,
    TResult Function(_GoogleLogin value)? googleLogin,
    required TResult orElse(),
  }) {
    if (googleLogin != null) {
      return googleLogin(this);
    }
    return orElse();
  }
}

abstract class _GoogleLogin implements LoginEvent {
  const factory _GoogleLogin() = _$_GoogleLogin;
}

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserData loginSuccess) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserData loginSuccess)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserData loginSuccess)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserData loginSuccess) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserData loginSuccess)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserData loginSuccess)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({UserData loginSuccess});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginSuccess = null,
  }) {
    return _then(_$_Success(
      null == loginSuccess
          ? _value.loginSuccess
          : loginSuccess // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.loginSuccess);

  @override
  final UserData loginSuccess;

  @override
  String toString() {
    return 'LoginState.success(loginSuccess: $loginSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            (identical(other.loginSuccess, loginSuccess) ||
                other.loginSuccess == loginSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserData loginSuccess) success,
  }) {
    return success(loginSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserData loginSuccess)? success,
  }) {
    return success?.call(loginSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserData loginSuccess)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(loginSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements LoginState {
  const factory _Success(final UserData loginSuccess) = _$_Success;

  UserData get loginSuccess;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
