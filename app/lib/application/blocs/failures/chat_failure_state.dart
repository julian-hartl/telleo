part of 'chat_failure_bloc.dart';

@freezed
class ChatFailureState with _$ChatFailureState {
  const factory ChatFailureState.initial() = _Initial;
  const factory ChatFailureState.couldNotSendMessage() =
      _CouldNotSendMessageFailure;
  const factory ChatFailureState.noConnection() = _NoConnectionFailure;
  const factory ChatFailureState.serverError() = _ServerErrorFailure;
}
