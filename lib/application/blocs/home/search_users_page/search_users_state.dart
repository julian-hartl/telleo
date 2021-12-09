part of 'search_users_bloc.dart';

@freezed
class SearchUsersState with _$SearchUsersState {
  const factory SearchUsersState({
    required AsyncValue<List<UserEntity>> users,
    required bool showSearch,
    required String query,
  }) = _SearchUsersState;
  factory SearchUsersState.initial() => const SearchUsersState(
        users: AsyncValue.loading(),
        query: '',
        showSearch: false,
      );
}
