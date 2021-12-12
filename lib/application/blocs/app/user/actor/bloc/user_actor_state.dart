part of 'user_actor_bloc.dart';

@freezed
class UserActorState with _$UserActorState {
  const factory UserActorState.initial() = _Initial;
  const factory UserActorState.actionInProgress() = _ActionInProgress;
}
