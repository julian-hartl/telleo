part of 'search_users_bloc.dart';

@freezed
class SearchUsersEvent with _$SearchUsersEvent {
  const factory SearchUsersEvent.started() = _Started;
}