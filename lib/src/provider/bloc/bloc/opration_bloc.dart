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
      (event, emit) {
        if (event is _AddData) {
          try {
            FirebaseCloudHelper.firebaseCloudHelper
                .insertData(movie: event.movie);
            emit(const _Success(true));
          } catch (_) {
            emit(const _Success(false));
          }
        }
      },
    );
  }
}
