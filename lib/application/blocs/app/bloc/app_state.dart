part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  factory AppState.initial() => AppState(
      user: const AsyncValue.loading(), chats: const AsyncValue.loading());
  factory AppState({
    required AsyncValue<Option<UserEntity>> user,
    required AsyncValue<List<ChatEntity>> chats,
  }) = _AppState;
}
