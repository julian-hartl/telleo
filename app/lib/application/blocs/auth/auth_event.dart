part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signOut() = _SignOut;
  const factory AuthEvent.signIn() = _SignIn;
  const factory AuthEvent.updateUser() = _UpdateUser;
}
