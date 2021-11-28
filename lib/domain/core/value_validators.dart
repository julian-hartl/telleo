import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<InvalidEmailFailure<String>, String> validateEmail(String input) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(input);
  if (emailValid) return right(input);
  return left(InvalidEmailFailure(failedValue: input));
}

Either<ShortPasswordFailure<String>, String> validatePassword(String input) {
  bool passwordShort = input.length < 8;
  if (passwordShort) return left(ShortPasswordFailure(failedValue: input));
  return right(input);
}
