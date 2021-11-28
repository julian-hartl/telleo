part of 'chats_page_bloc.dart';

@freezed
class ChatsPageState with _$ChatsPageState {
  const factory ChatsPageState.initial() = _Initial;
  const factory ChatsPageState({
    required List<ChatEntity> chats,
  }) = _ChatsPageState;
}
