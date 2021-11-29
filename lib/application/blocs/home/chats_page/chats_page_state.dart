part of 'chats_page_bloc.dart';

@freezed
class ChatsPageState with _$ChatsPageState {
  factory ChatsPageState.initial() => const ChatsPageState(
        chats: AsyncValue.loading(),
      );
  const factory ChatsPageState({
    required AsyncValue<List<ChatEntity>> chats,
  }) = _ChatsPageState;
}
