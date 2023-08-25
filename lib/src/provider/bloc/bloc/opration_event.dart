part of 'opration_bloc.dart';

@freezed
class OprationEvent with _$OprationEvent {
  const factory OprationEvent.addData(Movie movie) = _AddData;
  const factory OprationEvent.upDate(Movie movie,String docId) = _UpDate;
  const factory OprationEvent.getData(String docId) = _GetData;
}