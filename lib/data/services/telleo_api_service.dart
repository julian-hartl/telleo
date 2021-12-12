import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../config.dart';
import '../../domain/core/gateways/api_gateway.dart';
import '../../domain/core/services/api_service/api_failure.dart';
import '../../domain/core/services/api_service/api_service.dart';
import '../../domain/core/services/logger.dart';
import '../../domain/core/services/token_service/token_service.dart';
import '../../utils/dependencies.dart';

@LazySingleton(as: ApiService)
class TelleoApiService implements ApiService {
  TelleoApiService(this.apiGateway, this.tokenService, this.logger);

  final ApiGateway apiGateway;
  final TokenService tokenService;
  final ILogger logger;

  static const timeout = Duration(seconds: 10);

  String getEndpoint(String relPath) {
    return Config.backendUrl + relPath;
  }

  ApiFailure getFailureFromCode(int code) {
    switch (code) {
      case 101:
        return const ApiFailure.internalServerError();
      case 102:
        return const ApiFailure.missingProperty();
      case 100:
        return const ApiFailure.routeNotFound();
      case 200:
        return const ApiFailure.wrongPassword();
      case 201:
        return const ApiFailure.emailAlreadyInUse();
      case 202:
        return const ApiFailure.emailNotFound();
      case 203:
        return const ApiFailure.invalidEmail();
      case 204:
        return const ApiFailure.invalidPassword();
      case 205:
        return const ApiFailure.tokenExpired();
      case 206:
        return const ApiFailure.invalidRefreshToken();
      case 300:
        return const ApiFailure.userNotFound();
      default:
        return const ApiFailure.unknownError();
    }
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> delete(
      {required String path, Map<String, dynamic>? data}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> get(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    final accessToken = await tokenService.getAccessToken();

    try {
      final response = await apiGateway
          .get(
            endpoint: getEndpoint(path),
            header: {
              'Content-Type': 'application/json',
              'authorization': 'BEARER $accessToken'
            },
            queryParameters: queryParameters,
          )
          .timeout(timeout);
      logger.logInfo('Backend call responded\n$response');

      final error = response['error'];
      if (error != null) {
        if (error as bool) {
          final code = response['code'] as int;
          return left(
            getFailureFromCode(code),
          );
        } else {
          return right(response);
        }
      }
      return right(response);
    } catch (_) {
      return left(const ApiFailure.noConnection());
    }
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> post(
      {required String path, required Map<String, dynamic> data}) async {
    final accessToken = await tokenService.getAccessToken();

    try {
      final response = await apiGateway.post(
        endpoint: getEndpoint(path),
        body: data,
        header: {
          'Content-Type': 'application/json',
          'authorization': 'BEARER $accessToken'
        },
      ).timeout(timeout);
      logger.logInfo('Backend call responded\n$response');

      final error = response['error'];
      if (error != null) {
        if (error as bool) {
          final code = response['code'] as int;
          return left(
            getFailureFromCode(code),
          );
        } else {
          return right(response);
        }
      }
      return right(response);
    } catch (_) {
      return left(const ApiFailure.noConnection());
    }
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> update(
      {required String path, required Map<String, dynamic> data}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
