import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class AuthValueFailure<T> with _$AuthValueFailure<T> {
  const factory AuthValueFailure.invalidEmailAdress({
    required String failedValue,
  }) = InvalidEmailFailure<T>;
  const factory AuthValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPasswordFailure<T>;
  const factory AuthValueFailure.shortName({
    required String failedValue,
  }) = ShortNameFailure<T>;
}
