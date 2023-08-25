// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OprationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie) addData,
    required TResult Function(Movie movie, String docId) upDate,
    required TResult Function(String docId) getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie)? addData,
    TResult? Function(Movie movie, String docId)? upDate,
    TResult? Function(String docId)? getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie)? addData,
    TResult Function(Movie movie, String docId)? upDate,
    TResult Function(String docId)? getData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddData value) addData,
    required TResult Function(_UpDate value) upDate,
    required TResult Function(_GetData value) getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddData value)? addData,
    TResult? Function(_UpDate value)? upDate,
    TResult? Function(_GetData value)? getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddData value)? addData,
    TResult Function(_UpDate value)? upDate,
    TResult Function(_GetData value)? getData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OprationEventCopyWith<$Res> {
  factory $OprationEventCopyWith(
          OprationEvent value, $Res Function(OprationEvent) then) =
      _$OprationEventCopyWithImpl<$Res, OprationEvent>;
}

/// @nodoc
class _$OprationEventCopyWithImpl<$Res, $Val extends OprationEvent>
    implements $OprationEventCopyWith<$Res> {
  _$OprationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AddDataCopyWith<$Res> {
  factory _$$_AddDataCopyWith(
          _$_AddData value, $Res Function(_$_AddData) then) =
      __$$_AddDataCopyWithImpl<$Res>;
  @useResult
  $Res call({Movie movie});
}

/// @nodoc
class __$$_AddDataCopyWithImpl<$Res>
    extends _$OprationEventCopyWithImpl<$Res, _$_AddData>
    implements _$$_AddDataCopyWith<$Res> {
  __$$_AddDataCopyWithImpl(_$_AddData _value, $Res Function(_$_AddData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
  }) {
    return _then(_$_AddData(
      null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }
}

/// @nodoc

class _$_AddData implements _AddData {
  const _$_AddData(this.movie);

  @override
  final Movie movie;

  @override
  String toString() {
    return 'OprationEvent.addData(movie: $movie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddData &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddDataCopyWith<_$_AddData> get copyWith =>
      __$$_AddDataCopyWithImpl<_$_AddData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie) addData,
    required TResult Function(Movie movie, String docId) upDate,
    required TResult Function(String docId) getData,
  }) {
    return addData(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie)? addData,
    TResult? Function(Movie movie, String docId)? upDate,
    TResult? Function(String docId)? getData,
  }) {
    return addData?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie)? addData,
    TResult Function(Movie movie, String docId)? upDate,
    TResult Function(String docId)? getData,
    required TResult orElse(),
  }) {
    if (addData != null) {
      return addData(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddData value) addData,
    required TResult Function(_UpDate value) upDate,
    required TResult Function(_GetData value) getData,
  }) {
    return addData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddData value)? addData,
    TResult? Function(_UpDate value)? upDate,
    TResult? Function(_GetData value)? getData,
  }) {
    return addData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddData value)? addData,
    TResult Function(_UpDate value)? upDate,
    TResult Function(_GetData value)? getData,
    required TResult orElse(),
  }) {
    if (addData != null) {
      return addData(this);
    }
    return orElse();
  }
}

abstract class _AddData implements OprationEvent {
  const factory _AddData(final Movie movie) = _$_AddData;

  Movie get movie;
  @JsonKey(ignore: true)
  _$$_AddDataCopyWith<_$_AddData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpDateCopyWith<$Res> {
  factory _$$_UpDateCopyWith(_$_UpDate value, $Res Function(_$_UpDate) then) =
      __$$_UpDateCopyWithImpl<$Res>;
  @useResult
  $Res call({Movie movie, String docId});
}

/// @nodoc
class __$$_UpDateCopyWithImpl<$Res>
    extends _$OprationEventCopyWithImpl<$Res, _$_UpDate>
    implements _$$_UpDateCopyWith<$Res> {
  __$$_UpDateCopyWithImpl(_$_UpDate _value, $Res Function(_$_UpDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? docId = null,
  }) {
    return _then(_$_UpDate(
      null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
      null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpDate implements _UpDate {
  const _$_UpDate(this.movie, this.docId);

  @override
  final Movie movie;
  @override
  final String docId;

  @override
  String toString() {
    return 'OprationEvent.upDate(movie: $movie, docId: $docId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpDate &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.docId, docId) || other.docId == docId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie, docId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpDateCopyWith<_$_UpDate> get copyWith =>
      __$$_UpDateCopyWithImpl<_$_UpDate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie) addData,
    required TResult Function(Movie movie, String docId) upDate,
    required TResult Function(String docId) getData,
  }) {
    return upDate(movie, docId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie)? addData,
    TResult? Function(Movie movie, String docId)? upDate,
    TResult? Function(String docId)? getData,
  }) {
    return upDate?.call(movie, docId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie)? addData,
    TResult Function(Movie movie, String docId)? upDate,
    TResult Function(String docId)? getData,
    required TResult orElse(),
  }) {
    if (upDate != null) {
      return upDate(movie, docId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddData value) addData,
    required TResult Function(_UpDate value) upDate,
    required TResult Function(_GetData value) getData,
  }) {
    return upDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddData value)? addData,
    TResult? Function(_UpDate value)? upDate,
    TResult? Function(_GetData value)? getData,
  }) {
    return upDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddData value)? addData,
    TResult Function(_UpDate value)? upDate,
    TResult Function(_GetData value)? getData,
    required TResult orElse(),
  }) {
    if (upDate != null) {
      return upDate(this);
    }
    return orElse();
  }
}

abstract class _UpDate implements OprationEvent {
  const factory _UpDate(final Movie movie, final String docId) = _$_UpDate;

  Movie get movie;
  String get docId;
  @JsonKey(ignore: true)
  _$$_UpDateCopyWith<_$_UpDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetDataCopyWith<$Res> {
  factory _$$_GetDataCopyWith(
          _$_GetData value, $Res Function(_$_GetData) then) =
      __$$_GetDataCopyWithImpl<$Res>;
  @useResult
  $Res call({String docId});
}

/// @nodoc
class __$$_GetDataCopyWithImpl<$Res>
    extends _$OprationEventCopyWithImpl<$Res, _$_GetData>
    implements _$$_GetDataCopyWith<$Res> {
  __$$_GetDataCopyWithImpl(_$_GetData _value, $Res Function(_$_GetData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
  }) {
    return _then(_$_GetData(
      null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetData implements _GetData {
  const _$_GetData(this.docId);

  @override
  final String docId;

  @override
  String toString() {
    return 'OprationEvent.getData(docId: $docId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetData &&
            (identical(other.docId, docId) || other.docId == docId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, docId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDataCopyWith<_$_GetData> get copyWith =>
      __$$_GetDataCopyWithImpl<_$_GetData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie) addData,
    required TResult Function(Movie movie, String docId) upDate,
    required TResult Function(String docId) getData,
  }) {
    return getData(docId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie)? addData,
    TResult? Function(Movie movie, String docId)? upDate,
    TResult? Function(String docId)? getData,
  }) {
    return getData?.call(docId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie)? addData,
    TResult Function(Movie movie, String docId)? upDate,
    TResult Function(String docId)? getData,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(docId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddData value) addData,
    required TResult Function(_UpDate value) upDate,
    required TResult Function(_GetData value) getData,
  }) {
    return getData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddData value)? addData,
    TResult? Function(_UpDate value)? upDate,
    TResult? Function(_GetData value)? getData,
  }) {
    return getData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddData value)? addData,
    TResult Function(_UpDate value)? upDate,
    TResult Function(_GetData value)? getData,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(this);
    }
    return orElse();
  }
}

abstract class _GetData implements OprationEvent {
  const factory _GetData(final String docId) = _$_GetData;

  String get docId;
  @JsonKey(ignore: true)
  _$$_GetDataCopyWith<_$_GetData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OprationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Movie isSuccess) success,
    required TResult Function(bool isfialed) fialed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Movie isSuccess)? success,
    TResult? Function(bool isfialed)? fialed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Movie isSuccess)? success,
    TResult Function(bool isfialed)? fialed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Fialed value) fialed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Fialed value)? fialed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Fialed value)? fialed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OprationStateCopyWith<$Res> {
  factory $OprationStateCopyWith(
          OprationState value, $Res Function(OprationState) then) =
      _$OprationStateCopyWithImpl<$Res, OprationState>;
}

/// @nodoc
class _$OprationStateCopyWithImpl<$Res, $Val extends OprationState>
    implements $OprationStateCopyWith<$Res> {
  _$OprationStateCopyWithImpl(this._value, this._then);

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
    extends _$OprationStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'OprationState.initial()';
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
    required TResult Function(Movie isSuccess) success,
    required TResult Function(bool isfialed) fialed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Movie isSuccess)? success,
    TResult? Function(bool isfialed)? fialed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Movie isSuccess)? success,
    TResult Function(bool isfialed)? fialed,
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
    required TResult Function(_Fialed value) fialed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Fialed value)? fialed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Fialed value)? fialed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OprationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({Movie isSuccess});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$OprationStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
  }) {
    return _then(_$_Success(
      null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.isSuccess);

  @override
  final Movie isSuccess;

  @override
  String toString() {
    return 'OprationState.success(isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Movie isSuccess) success,
    required TResult Function(bool isfialed) fialed,
  }) {
    return success(isSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Movie isSuccess)? success,
    TResult? Function(bool isfialed)? fialed,
  }) {
    return success?.call(isSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Movie isSuccess)? success,
    TResult Function(bool isfialed)? fialed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(isSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Fialed value) fialed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Fialed value)? fialed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Fialed value)? fialed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements OprationState {
  const factory _Success(final Movie isSuccess) = _$_Success;

  Movie get isSuccess;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FialedCopyWith<$Res> {
  factory _$$_FialedCopyWith(_$_Fialed value, $Res Function(_$_Fialed) then) =
      __$$_FialedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isfialed});
}

/// @nodoc
class __$$_FialedCopyWithImpl<$Res>
    extends _$OprationStateCopyWithImpl<$Res, _$_Fialed>
    implements _$$_FialedCopyWith<$Res> {
  __$$_FialedCopyWithImpl(_$_Fialed _value, $Res Function(_$_Fialed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isfialed = null,
  }) {
    return _then(_$_Fialed(
      null == isfialed
          ? _value.isfialed
          : isfialed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Fialed implements _Fialed {
  const _$_Fialed(this.isfialed);

  @override
  final bool isfialed;

  @override
  String toString() {
    return 'OprationState.fialed(isfialed: $isfialed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fialed &&
            (identical(other.isfialed, isfialed) ||
                other.isfialed == isfialed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isfialed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FialedCopyWith<_$_Fialed> get copyWith =>
      __$$_FialedCopyWithImpl<_$_Fialed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Movie isSuccess) success,
    required TResult Function(bool isfialed) fialed,
  }) {
    return fialed(isfialed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Movie isSuccess)? success,
    TResult? Function(bool isfialed)? fialed,
  }) {
    return fialed?.call(isfialed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Movie isSuccess)? success,
    TResult Function(bool isfialed)? fialed,
    required TResult orElse(),
  }) {
    if (fialed != null) {
      return fialed(isfialed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Fialed value) fialed,
  }) {
    return fialed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Fialed value)? fialed,
  }) {
    return fialed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Fialed value)? fialed,
    required TResult orElse(),
  }) {
    if (fialed != null) {
      return fialed(this);
    }
    return orElse();
  }
}

abstract class _Fialed implements OprationState {
  const factory _Fialed(final bool isfialed) = _$_Fialed;

  bool get isfialed;
  @JsonKey(ignore: true)
  _$$_FialedCopyWith<_$_Fialed> get copyWith =>
      throw _privateConstructorUsedError;
}
