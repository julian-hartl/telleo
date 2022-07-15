part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loadInProgress() = _LoadingInProgress;
  factory ChatState.loadingSuccess(KtList<ChatEntity> chats) = _LoadingSuccess;
  factory ChatState.loadingFailure(ChatsFailure failure) = _LoadingFailure;
}
