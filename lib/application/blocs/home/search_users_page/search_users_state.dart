part of 'search_users_bloc.dart';

@freezed
class SearchUsersState with _$SearchUsersState {
  const factory SearchUsersState.loadingSuccessful(
      KtList<SearchResult> results) = _LoadingSuccessful;
  const factory SearchUsersState.loadingResults() = _LoadingResults;
  const factory SearchUsersState.loadingFailure() = _LoadingFailure;
  const factory SearchUsersState.initial() = _Initial;
}
