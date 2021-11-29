import 'package:dartz/dartz.dart';
import '../core/value_objects.dart';
import 'auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword({
    required EmailAdress email,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAdress email,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
