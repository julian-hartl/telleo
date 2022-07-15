import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.cancelledByUser() = _CancelledByUser;
  const factory AuthFailure.invalidEmailPasswordCombination() =
      _InvalidEmailPasswordCombination;
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthFailure.invalidEmail() = _InvalidEmail;
  const factory AuthFailure.invalidPassword() = _InvalidPassword;
  const factory AuthFailure.localStorageError() = _LocalStorageError;
}
