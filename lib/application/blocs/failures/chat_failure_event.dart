part of 'chat_failure_bloc.dart';

@freezed
class ChatFailureEvent with _$ChatFailureEvent {
  const factory ChatFailureEvent.started() = _Started;
}