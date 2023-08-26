part of 'movie_data_bloc.dart';

@freezed
class MovieDataState with _$MovieDataState {
  const factory MovieDataState.initial() = _Initial;
  const factory MovieDataState.loding() = _Loding;
  const factory MovieDataState.success(List<Movie> data) = _Success;
  const factory MovieDataState.error(String massage) = _Error;
}
