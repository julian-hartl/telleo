part of 'chat_failure_bloc.dart';

@freezed
class ChatFailureEvent with _$ChatFailureEvent {
  const factory ChatFailureEvent.couldNotSendMessage() = _CouldNotSendMessage;
  const factory ChatFailureEvent.noConnection() = _NoConnection;
  const factory ChatFailureEvent.serverError() = _ServerError;
}
