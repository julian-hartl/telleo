import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.emailAdress({
    required String failedValue,
  }) = InvalidEmailFailure<T>;
  const factory ValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPasswordFailure<T>;
}
