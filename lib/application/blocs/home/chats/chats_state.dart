part of 'chats_bloc.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState.loading() = LoadingChats;
  const factory ChatsState.retrieved() = RetrievedChats;
  const factory ChatsState.error({required String message}) = ErrorLoadingChats;
  const factory ChatsState.inital() = _Initial;
}
