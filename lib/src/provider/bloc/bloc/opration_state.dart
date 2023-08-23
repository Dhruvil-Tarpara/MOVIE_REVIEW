part of 'opration_bloc.dart';

@freezed
class OprationState with _$OprationState {
  const factory OprationState.initial() = _Initial;
  const factory OprationState.success(bool isSuccess) = _Success;
  const factory OprationState.fialed() = _Fialed;
}
