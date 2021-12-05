import 'package:freezed_annotation/freezed_annotation.dart';
import 'base/value_failure.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class AuthValueFailure<T>
    with _$AuthValueFailure<T>
    implements ValueFailure<T> {
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

@freezed
abstract class GeneralValueFailure<T>
    with _$GeneralValueFailure<T>
    implements ValueFailure<T> {
  const factory GeneralValueFailure.invalidUrl(String url) =
      InvalidUrlFailure<T>;
}
