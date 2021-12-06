import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';

@freezed
abstract class ApiFailure with _$ApiFailure {
  const factory ApiFailure.internalServerError() = _InternalServerError;
  const factory ApiFailure.emailNotFound() = _EmailNotFound;
  const factory ApiFailure.wrongPassword() = _WrongPassword;
  const factory ApiFailure.invalidPassword() = _InvalidPassword;
  const factory ApiFailure.invalidEmail() = _InvalidEmail;
  const factory ApiFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory ApiFailure.routeNotFound() = _RouteNotFound;
  const factory ApiFailure.missingProperty() = _MissingProperty;
  const factory ApiFailure.tokenExpired() = _TokenExpired;
  const factory ApiFailure.userNotFound() = _UserNotFound;
  const factory ApiFailure.unknownError() = _UnknownError;
  const factory ApiFailure.invalidRefreshToken() = _InvalidRefreshToken;
}
