part of 'chat_actor_bloc.dart';

@freezed
class ChatActorState with _$ChatActorState {
  const factory ChatActorState.initial() = _Initial;
  const factory ChatActorState.actionInProgress() = _ActionInProgress;
  const factory ChatActorState.sendMessageSuccess() = _SendMessageSuccess;
  const factory ChatActorState.sendMessageFailure() = _SendMessageFailure;
}
