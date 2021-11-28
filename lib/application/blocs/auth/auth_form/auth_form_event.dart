part of 'auth_form_bloc.dart';

@freezed
class AuthFormEvent with _$AuthFormEvent {
  const factory AuthFormEvent.emailChanged(String email) = AuthEmailChanged;
  const factory AuthFormEvent.passwordChanged(String password) =
      AuthPasswordChanged;
  const factory AuthFormEvent.signIn() = AuthSignIn;
  const factory AuthFormEvent.signInWithGoogle() = AuthSignInWithGoogle;
  const factory AuthFormEvent.signUp() = AuthSignUp;
}
