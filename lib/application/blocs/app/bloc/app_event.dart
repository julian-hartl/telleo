part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.updateChats({
    Option<List<ChatEntity>>? chats,
  }) = _UpdateChats;
  const factory AppEvent.updateUser({
    Option<UserEntity>? user,
  }) = _UpdateUser;
}
