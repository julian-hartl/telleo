part of 'chat_page_bloc.dart';

@freezed
class ChatPageState with _$ChatPageState {
  const factory ChatPageState({
    required ChatEntity chat,
    required UserEntity currentUser,
  }) = _ChatPageState;
  factory ChatPageState.initial(
          {required ChatEntity chat, required UserEntity currentUser}) =>
      _ChatPageState(
        chat: chat,
        currentUser: currentUser,
      );
}
