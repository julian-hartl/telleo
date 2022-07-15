part of 'chat_actor_bloc.dart';

@freezed
class ChatActorEvent with _$ChatActorEvent {
  const factory ChatActorEvent.updateChat(
    ChatEntity chat,
  ) = _UpdateChat;
  const factory ChatActorEvent.addChat(
    ChatEntity chat,
  ) = _AddChat;
  const factory ChatActorEvent.addMessage({
    required String message,
    required String chatId,
    required String sender,
  }) = _AddMessage;
}
