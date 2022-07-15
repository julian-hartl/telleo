part of 'chats_page_bloc.dart';

@freezed
class ChatsPageEvent with _$ChatsPageEvent {
  const factory ChatsPageEvent.started() = _Started;
  const factory ChatsPageEvent.retry() = _Retry;
}
