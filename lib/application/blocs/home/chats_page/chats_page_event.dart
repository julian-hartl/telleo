part of 'chats_page_bloc.dart';

@freezed
class ChatsPageEvent with _$ChatsPageEvent {
  const factory ChatsPageEvent.updateChats({required List<ChatEntity> chats}) =
      _UpdateChats;
  const factory ChatsPageEvent.error({required String message}) =
      ChatsPageError;
}
