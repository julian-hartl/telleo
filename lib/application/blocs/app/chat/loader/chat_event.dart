part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.updateChats(
    KtList<ChatEntity> chats,
  ) = _UpdateChats;
  const factory ChatEvent.loadChats() = _LoadChats;
}
