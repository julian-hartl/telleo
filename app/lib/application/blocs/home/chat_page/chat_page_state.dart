part of 'chat_page_bloc.dart';

@freezed
class ChatPageState with _$ChatPageState {
  const factory ChatPageState.loadingMessages() = _LoadingMessages;
  const factory ChatPageState.loadingSuccess(KtList<MessageEntity> messages) =
      _LoadingSuccess;
  const factory ChatPageState.loadingFailure(String message) = _LoadingFailure;
  const factory ChatPageState.initial() = _Initial;
}
