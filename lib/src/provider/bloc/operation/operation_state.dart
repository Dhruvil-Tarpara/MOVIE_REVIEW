part of 'operation_bloc.dart';

@freezed
class OperationState with _$OperationState {
  const factory OperationState.initial() = _Initial;
  const factory OperationState.success(Movie isSuccess) = _Success;
  const factory OperationState.fialed(bool isfialed) = _Fialed;
}
