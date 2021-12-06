part of 'chat_page_bloc.dart';

@freezed
class ChatPageEvent with _$ChatPageEvent {
  const factory ChatPageEvent.onMessageReceived(String message) =
      _OnMessageReceieved;
}
