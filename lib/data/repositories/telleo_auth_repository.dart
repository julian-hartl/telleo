import 'package:injectable/injectable.dart';
import '../../domain/core/services/api_service/api_service.dart';
import '../../domain/core/value_objects.dart';
import '../../domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/auth/auth_repository.dart';

import '../../domain/user/user_state.dart';

@LazySingleton(as: AuthRepository)
class TelleoAuthRepository implements AuthRepository {
  final UserState userState;
  final ApiService apiService;

  TelleoAuthRepository(this.userState, this.apiService);

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAdress email, required Password password}) async {
    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword(
      {required EmailAdress email, required Password password}) async {
    return left(const AuthFailure.serverError());
  }
}
