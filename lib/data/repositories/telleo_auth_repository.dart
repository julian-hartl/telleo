import 'package:injectable/injectable.dart';
import '../../application/blocs/app/bloc/app_bloc.dart';
import '../../config.dart';
import '../models/user_model.dart';
import '../../domain/core/async_value.dart';
import '../../domain/core/gateways/local_storage.dart';
import '../../domain/core/services/logger.dart';
import '../../domain/core/services/token_service/token_service.dart';
import '../../utils/dependencies.dart';
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
  final TokenService tokenService;

  TelleoAuthRepository(this.userState, this.apiService, this.tokenService);

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAdress email, required Password password}) async {
    final response = await apiService.post(
        path: '/auth/v${Config.authVersion}/signin',
        data: {'email': email.getOrCrash(), 'password': password.getOrCrash()});
    return await response.fold((failure) async {
      return failure.maybeWhen(emailNotFound: () {
        return left(const AuthFailure.invalidEmailPasswordCombination());
      }, wrongPassword: () {
        return left(const AuthFailure.invalidEmailPasswordCombination());
      }, internalServerError: () {
        return left(const AuthFailure.serverError());
      }, orElse: () {
        app.get<ILogger>().logError('Uncaught failure.');
        return left(const AuthFailure.serverError());
      });
    }, (json) async {
      final user = UserModel.fromJson(json['user']);
      final refreshToken = json['tokens']['refreshToken'] as String;
      final accessToken = json['tokens']['accessToken'] as String;
      final storedAccessToken =
          await tokenService.storeAccessToken(accessToken);
      final storedRefreshToken =
          await tokenService.storeRefreshToken(refreshToken);
      if (!storedRefreshToken || !storedAccessToken) {
        return left(const AuthFailure.localStorageError());
      }
      app.get<AppBloc>().add(
            AppEvent.updateUser(
              user: AsyncValue.data(
                some(
                  user.toEntity(),
                ),
              ),
            ),
          );
      return right(unit);
    });
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword(
      {required EmailAdress email, required Password password}) async {
    final response = await apiService.post(
        path: '/auth/v${Config.authVersion}/signup',
        data: {'email': email.getOrCrash(), 'password': password.getOrCrash()});
    return await response.fold((failure) async {
      return failure.maybeWhen(emailAlreadyInUse: () {
        return left(const AuthFailure.emailAlreadyInUse());
      }, invalidEmail: () {
        return left(const AuthFailure.invalidEmail());
      }, invalidPassword: () {
        return left(const AuthFailure.invalidPassword());
      }, internalServerError: () {
        return left(const AuthFailure.serverError());
      }, orElse: () {
        app.get<ILogger>().logError('Uncaught failure.');
        return left(const AuthFailure.serverError());
      });
    }, (json) async {
      final user = UserModel.fromJson(json['user']);
      final refreshToken = json['tokens']['refreshToken'] as String;
      final accessToken = json['tokens']['accessToken'] as String;
      final storedAccessToken =
          await tokenService.storeAccessToken(accessToken);
      final storedRefreshToken =
          await tokenService.storeRefreshToken(refreshToken);
      if (!storedRefreshToken || !storedAccessToken) {
        return left(const AuthFailure.localStorageError());
      }
      app.get<AppBloc>().add(
            AppEvent.updateUser(
              user: AsyncValue.data(
                some(
                  user.toEntity(),
                ),
              ),
            ),
          );
      return right(unit);
    });
  }
}
