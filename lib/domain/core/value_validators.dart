import 'package:dartz/dartz.dart';

import 'value_failures.dart';

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

Either<ShortNameFailure<String>, String> validateName(String input) {
  bool nameShort = input.length < 2;
  if (nameShort) return left(ShortNameFailure(failedValue: input));
  return right(input);
}

Either<InvalidUrlFailure<String>, String> validateUrl(String input) {
  final bool validUrl = RegExp(
          r"""https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)""")
      .hasMatch(input);
  if (validUrl) {
    return right(input);
  }
  return left(InvalidUrlFailure(input));
}
