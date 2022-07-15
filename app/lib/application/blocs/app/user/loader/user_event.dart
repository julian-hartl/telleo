part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updateUser(
    UserEntity user,
  ) = _UpdateUser;
  const factory UserEvent.loadUser() = _LoadUser;
}
