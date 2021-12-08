part of 'chats_page_bloc.dart';

@freezed
class ChatsPageState with _$ChatsPageState {
  factory ChatsPageState.initial(AsyncValue<UserEntity> user) => ChatsPageState(
        chats: const AsyncValue.loading(),
        user: user,
      );
  const factory ChatsPageState({
    required AsyncValue<List<ChatEntity>> chats,
    required AsyncValue<UserEntity> user,
  }) = _ChatsPageState;
}
