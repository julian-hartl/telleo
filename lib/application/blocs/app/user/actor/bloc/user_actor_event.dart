part of 'user_actor_bloc.dart';

@freezed
class UserActorEvent with _$UserActorEvent {
  const factory UserActorEvent.started() = _Started;
}
