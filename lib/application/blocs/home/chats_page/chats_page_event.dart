part of 'chats_page_bloc.dart';

@freezed
class ChatsPageEvent with _$ChatsPageEvent {
  const factory ChatsPageEvent.updateChats({
    required AsyncValue<List<ChatEntity>> chats,
  }) = _UpdateChats;
  const factory ChatsPageEvent.error({required String message}) = _Error;
  const factory ChatsPageEvent.retry() = _Retry;
}
