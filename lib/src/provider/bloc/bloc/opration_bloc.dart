import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_review/src/provider/firebase/firestore/firebase_cloud.dart';
import 'package:movie_review/src/provider/firebase/firestore/movie_model.dart';

part 'opration_event.dart';
part 'opration_state.dart';
part 'opration_bloc.freezed.dart';

class OprationBloc extends Bloc<OprationEvent, OprationState> {
  OprationBloc() : super(const _Initial()) {
    on<OprationEvent>(
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
