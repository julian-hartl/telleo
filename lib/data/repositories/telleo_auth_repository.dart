import 'package:injectable/injectable.dart';
import 'package:telleo/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:telleo/domain/auth/auth_repository.dart';
import 'package:telleo/domain/core/services/api_service.dart';
import 'package:telleo/domain/states/user_state.dart';

@LazySingleton(as: AuthRepository)
class TelleoAuthRepository implements AuthRepository {
  final UserState userState;
  final ApiService apiService;

  TelleoAuthRepository(this.userState, this.apiService);

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
