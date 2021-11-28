import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_failures.freezed.dart';

@freezed
abstract class UserFailure with _$UserFailure {
  const factory UserFailure.serverError() = UserServerFailure;
  const factory UserFailure.noConnection() = NoConnectionFailure;
  const factory UserFailure.invalidAccessToken() = InvalidAccessTokenFailure;
}
