import 'package:dartz/dartz.dart';
import '../core/failures.dart';
import '../core/value_object.dart';
import '../core/value_validators.dart';

class EmailAdress extends ValueObject<String> {
  factory EmailAdress(String input) {
    return EmailAdress._(validateEmail(input));
  }

  @override
  final Either<ValueFailure<String>, String> value;

  const EmailAdress._(this.value);
}

class Password extends ValueObject<String> {
  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  @override
  final Either<ValueFailure<String>, String> value;

  const Password._(this.value);
}
