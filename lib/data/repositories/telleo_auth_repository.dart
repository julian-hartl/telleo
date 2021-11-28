import 'package:injectable/injectable.dart';
import 'package:telleo/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:telleo/domain/auth/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class TelleoAuthRepository implements AuthRepository {
  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    return left(const AuthFailure.serverError());
  }
}
