part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.updateChats({
    AsyncValue<List<ChatEntity>>? chats,
  }) = _UpdateChats;
  const factory AppEvent.addChat({
    required ChatEntity chat,
  }) = _AddChat;
  const factory AppEvent.updateUser({
    AsyncValue<Option<UserEntity>>? user,
  }) = _UpdateUser;
}
