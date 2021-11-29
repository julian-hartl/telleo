part of 'auth_form_bloc.dart';

@freezed
class AuthFormEvent with _$AuthFormEvent {
  const factory AuthFormEvent.emailChanged(String email) = _EmailChanged;
  const factory AuthFormEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory AuthFormEvent.signIn() = _SignIn;
  const factory AuthFormEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory AuthFormEvent.signUp() = _SignUp;
}
