import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_review/src/provider/firebase/firestore/firebase_cloud.dart';
import 'package:movie_review/src/provider/firebase/firestore/movie_model.dart';

part 'operation_event.dart';
part 'operation_state.dart';
part 'operation_bloc.freezed.dart';

class OperationBloc extends Bloc<OperationEvent, OperationState> {
  OperationBloc() : super(const _Initial()) {
    on<OperationEvent>(
      (event, emit) async {
        if (event is _AddData) {
          try {
            FirebaseCloudHelper.firebaseCloudHelper
                .insertData(movie: event.movie);
            emit(const _Fialed(false));
          } catch (_) {
            emit(const _Fialed(true));
          }
        } else if (event is _UpDate) {
          try {
            FirebaseCloudHelper.firebaseCloudHelper
                .upDateData(docId: event.docId, data: event.movie);
            Movie movie = await FirebaseCloudHelper.firebaseCloudHelper
                .getMovie(docId: event.docId);
            emit(_Success(movie));
          } catch (_) {
            emit(const _Fialed(true));
          }
        } else if (event is _GetData) {
          try {
            Movie movie = await FirebaseCloudHelper.firebaseCloudHelper
                .getMovie(docId: event.docId);
            emit(_Success(movie));
          } catch (_) {
            emit(const _Fialed(true));
          }
        }
      },
    );
  }
}
