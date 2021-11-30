part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  factory AppState.initial() => AppState(user: none(), chats: none());
  factory AppState({
    required Option<UserEntity> user,
    required Option<List<ChatEntity>> chats,
  }) = _AppState;
}
