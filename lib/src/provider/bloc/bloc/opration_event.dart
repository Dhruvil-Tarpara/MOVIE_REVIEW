part of 'opration_bloc.dart';

@freezed
class OprationEvent with _$OprationEvent {
  const factory OprationEvent.addData(Movie movie) = _AddData;
}