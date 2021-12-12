part of 'auth_form_bloc.dart';

@freezed
abstract class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    required bool obscurePassword,
    required EmailAdress emailAdress,
    required Password password,
    required bool isSubmitting,
    required bool showErrorMessages,

    /// [authFailureOrSuccess] is none when theres neither a failure nor a success --> it contains a [AuthFailure] when something went wrong
    required Option<Either<AuthFailure, UserEntity>> authFailureOrSuccess,
  }) = _AuthState;
  factory AuthFormState.initial() => AuthFormState(
        showErrorMessages: false,
        obscurePassword: false,
        emailAdress: EmailAdress(''),
        password: Password(''),
        isSubmitting: false,
        authFailureOrSuccess: none(),
      );
}
