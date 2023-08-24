import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/provider/firebase/firestore/firebase_cloud.dart';
import 'package:movie_review/src/provider/firebase/firestore/movie_model.dart';

part 'movie_data_event.dart';
part 'movie_data_state.dart';
part 'movie_data_bloc.freezed.dart';

class MovieDataBloc extends Bloc<MovieDataEvent, MovieDataState> {
  List<Movie> allMovie = [];
  MovieDataBloc() : super(const _Initial()) {
    on<MovieDataEvent>(
      (event, emit) async {
        if (event is _GetData) {
          emit(const _Loding());
          allMovie = await FirebaseCloudHelper.firebaseCloudHelper.getData();
          if (allMovie.isNotEmpty) {
            emit(_Success(allMovie));
          } else {
            emit(const _Error(ConstString.noData));
          }
        } else if (event is _SearchData) {
          emit(const _Loding());
          List<Movie> data = allMovie
              .where((element) => element.movieName!.contains(event.value))
              .toList();

          if (data.isNotEmpty) {
            emit(_Success(data));
          } else {
            emit(const _Loding());
            await Future.delayed(const Duration(milliseconds: 600));
            emit(const _Error(ConstString.noData));
          }
        } else {
          allMovie = await FirebaseCloudHelper.firebaseCloudHelper.getData();
          if (allMovie.isNotEmpty) {
            emit(_Success(allMovie));
          } else {
            emit(const _Error(ConstString.noData));
          }
        }
      },
    );
  }
}
