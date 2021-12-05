part of 'chats_page_bloc.dart';

@freezed
class ChatsPageState with _$ChatsPageState {
  factory ChatsPageState.initial(AsyncValue<UserEntity> user) => ChatsPageState(
      chats: const AsyncValue.loading(),
      user: user,
      test: const AsyncValue.loading());
  const factory ChatsPageState({
    required AsyncValue<List<ChatEntity>> chats,
    required AsyncValue<UserEntity> user,
    required AsyncValue<String> test,
  }) = _ChatsPageState;
}
