part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.emailChanged(String email) = AuthEmailChanged;
  const factory AuthEvent.passwordChanged(String password) =
      AuthPasswordChanged;
  const factory AuthEvent.signIn() = AuthSignIn;
  const factory AuthEvent.signInWithGoogle() = AuthSignInWithGoogle;
  const factory AuthEvent.signUp() = AuthSignUp;
}
