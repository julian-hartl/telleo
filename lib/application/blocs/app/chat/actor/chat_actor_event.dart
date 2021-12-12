part of 'chat_actor_bloc.dart';

@freezed
class ChatActorEvent with _$ChatActorEvent {
  const factory ChatActorEvent.updateChat(
    ChatEntity chat,
  ) = _UpdateChat;
  const factory ChatActorEvent.addChat(
    String withId,
  ) = _AddChat;
  const factory ChatActorEvent.addMessage({
    required ChatEntity chat,
    required String content,
  }) = _AddMessage;
}
