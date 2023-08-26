part of 'movie_data_bloc.dart';

@freezed
class MovieDataEvent with _$MovieDataEvent {
  const factory MovieDataEvent.getData() = _GetData;
  const factory MovieDataEvent.searchData(String value) = _SearchData;
  const factory MovieDataEvent.searchUser(String value) = _SearchUser;
  const factory MovieDataEvent.refreshData() = _RefreshData;
}
