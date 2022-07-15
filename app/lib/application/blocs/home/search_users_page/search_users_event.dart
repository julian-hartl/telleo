part of 'search_users_bloc.dart';

@freezed
class SearchUsersEvent with _$SearchUsersEvent {
  const factory SearchUsersEvent.queryChanged({required String query}) =
      _QueryChanged;
}
