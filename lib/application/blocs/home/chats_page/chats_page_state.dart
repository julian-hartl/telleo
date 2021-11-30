part of 'chats_page_bloc.dart';

@freezed
class ChatsPageState with _$ChatsPageState {
  factory ChatsPageState.initial() => const ChatsPageState(
        chats: [],
        loading: true,
      );
  const factory ChatsPageState({
    required List<ChatEntity> chats,
    required bool loading,
  }) = _ChatsPageState;
}
