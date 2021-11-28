part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required bool obscurePassword,
    required EmailAdress emailAdress,
    required Password password,
    required bool isSubmitting,
    required bool showErrorMessages,

    /// [authFailureOrSuccess] is none when theres neither a failure nor a success --> it contains a [AuthFailure] when something went wrong
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccess,
  }) = _AuthState;
  factory AuthState.initial() => AuthState(
        showErrorMessages: false,
        obscurePassword: false,
        emailAdress: EmailAdress(''),
        password: Password(''),
        isSubmitting: false,
        authFailureOrSuccess: none(),
      );
}
