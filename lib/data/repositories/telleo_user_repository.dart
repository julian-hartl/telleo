import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../config.dart';
import '../../domain/core/services/api_service/api_service.dart';
import '../../domain/core/services/logger.dart';
import '../../domain/core/services/token_service/token_service.dart';
import '../../domain/user/user_entity.dart';
import '../../domain/user/user_failures.dart';
import '../../domain/user/user_repository.dart';
import '../../utils/dependencies.dart';
import '../models/user_model.dart';

@LazySingleton(as: UserRepository)
class TelleoUserRepository implements UserRepository {
  final TokenService tokenService;
  final ApiService apiService;

  TelleoUserRepository(this.tokenService, this.apiService);

  @override
  Future<Either<UserFailure, UserEntity>> getCurrentUser() async {
    final accessToken = await tokenService.getAccessToken();
    if (accessToken == null) {
      return left(const UserFailure.noUserFound());
    }
    final response = await apiService.get(
        path: '/api/v${Config.apiVersion}/users/token/$accessToken');
    return await response.fold((failure) {
      return failure.maybeWhen(internalServerError: () {
        return left(const UserFailure.serverError());
      }, userNotFound: () {
        return left(const UserFailure.noUserFound());
      }, orElse: () {
        app.get<ILogger>().logError('Uncaught failure.');
        return left(const UserFailure.serverError());
      });
    }, (json) {
      final user = UserModel.fromJson(json['user']);
      return right(user.toEntity());
    });
  }

  Future<Either<UserFailure, List<UserEntity>>> getAllUsers() async {
    final response =
        await apiService.get(path: '/api/v${Config.apiVersion}/users');
    return await response.fold((failure) {
      return failure.maybeWhen(internalServerError: () {
        return left(const UserFailure.serverError());
      }, orElse: () {
        app.get<ILogger>().logError('Uncaught failure.');
        return left(const UserFailure.serverError());
      });
    }, (json) {
      final users = (json['users'] as List)
          .map((user) => UserModel.fromJson(json).toEntity())
          .toList();
      return right(users);
    });
  }

  @override
  Future<Either<UserFailure, List<UserEntity>>> searchUsers(
      {String? query}) async {
    final accessToken = await tokenService.getAccessToken();
    if (accessToken == null) {
      return right([]);
    }
    if (query != null) {
      final response = await apiService.get(
          path: '/api/v${Config.apiVersion}/users/search/$query');
      return await response.fold((failure) {
        return failure.maybeWhen(internalServerError: () {
          return left(const UserFailure.serverError());
        }, orElse: () {
          app.get<ILogger>().logError('Uncaught failure.');
          return left(const UserFailure.serverError());
        });
      }, (json) {
        final users = (json['users'] as List)
            .map((user) => UserModel.fromJson(user).toEntity())
            .toList();
        return right(users);
      });
    } else {
      return await getAllUsers();
    }
  }
}
