part of 'chats_page_bloc.dart';

@freezed
class ChatsPageEvent with _$ChatsPageEvent {
  const factory ChatsPageEvent.initial() = _Initial;
  const factory ChatsPageEvent.loadingChats() = ChatsPageLoadingChats;
  const factory ChatsPageEvent.retrievedChats() = ChatsPageRetrievedChats;
  const factory ChatsPageEvent.error({required String message}) =
      ChatsPageError;
}
