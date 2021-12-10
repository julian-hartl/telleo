part of 'search_users_bloc.dart';

@freezed
class SearchUsersEvent with _$SearchUsersEvent {
  const factory SearchUsersEvent.onQueryChanged({required String query}) =
      _OnQueryChanged;
  const factory SearchUsersEvent.createChat({required String withId}) =
      _CreateChat;
  const factory SearchUsersEvent.clearQuery() = _ClearQuery;
}
