import 'package:dartz/dartz.dart';
import 'package:telleo/domain/user/user_entity.dart';

import 'auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, UserEntity>> signUpWithEmailAndPassword({
    required EmailAdress email,
    required Password password,
  });
  Future<Either<AuthFailure, UserEntity>> signInWithEmailAndPassword({
    required EmailAdress email,
    required Password password,
  });

  Future<Either<AuthFailure, UserEntity>> signInWithGoogle();
}
