part of 'operation_bloc.dart';

@freezed
class OperationEvent with _$OperationEvent {
   const factory OperationEvent.addData(Movie movie) = _AddData;
  const factory OperationEvent.upDate(Movie movie,String docId) = _UpDate;
  const factory OperationEvent.getData(String docId) = _GetData;
}