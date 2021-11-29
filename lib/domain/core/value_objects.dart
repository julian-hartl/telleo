import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import 'base/value_object.dart';
import 'value_failures.dart';

import 'value_validators.dart';

class EmailAdress extends ValueObject<String> {
  factory EmailAdress(String input) {
    return EmailAdress._(validateEmail(input));
  }

  @override
  final Either<AuthValueFailure<String>, String> value;

  const EmailAdress._(this.value);
}

class Password extends ValueObject<String> {
  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  @override
  final Either<AuthValueFailure<String>, String> value;

  const Password._(this.value);
}

class Name extends ValueObject<String> {
  factory Name(String input) {
    return Name._(validateName(input));
  }

  @override
  final Either<AuthValueFailure<String>, String> value;

  const Name._(this.value);
}

class UniqueId extends ValueObject<String> {
  factory UniqueId() {
    return UniqueId._(right(const Uuid().v1()));
  }

  factory UniqueId.fromExistingUid(String uid) {
    return UniqueId._(right(uid));
  }

  @override
  final Either<AuthValueFailure<String>, String> value;

  const UniqueId._(this.value);
}
