import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telleo/domain/core/value_failures.dart';
import 'package:telleo/domain/core/value_validators.dart';

void main() {
  group('ValueValidators', () {
    group('EmailValidator', () {
      test('should return the passed email when email is valid', () {
        const email = 'riam@gobrod.il';

        final emailResult = validateEmail(email);

        expect(emailResult, const Right(email));
        expect(emailResult.getOrElse(() => ''), email);
      });

      test('should return a InvalidEmailFailure when email is invalid', () {
        const email = 'riamgobrod.il';

        final emailResult = validateEmail(email);

        expect(emailResult,
            const Left(InvalidEmailFailure<String>(failedValue: email)));
      });
    });

    group('PasswordValidator', () {
      test('should return the passed password when password is valid', () {
        const password = 'OYJESijfxekSywRevWAc';

        final passwordResult = validatePassword(password);

        expect(passwordResult, const Right(password));
        expect(passwordResult.getOrElse(() => ''), password);
      });

      test('should return a ShortPasswordFailure when password is < 8', () {
        const password = 'wnItREx';

        final passwordResult = validatePassword(password);

        expect(passwordResult,
            const Left(ShortPasswordFailure<String>(failedValue: password)));
      });
    });
  });
}
