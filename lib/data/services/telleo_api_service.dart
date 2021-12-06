import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../config.dart';
import '../../domain/auth/auth_failure.dart';
import '../../domain/core/gateways/api_gateway.dart';
import '../../domain/core/gateways/local_storage.dart';
import '../../domain/core/services/logger.dart';
import '../../domain/core/services/token_service/token_service.dart';
import '../../utils/dependencies.dart';

import '../../domain/core/services/api_service/api_failure.dart';
import '../../domain/core/services/api_service/api_service.dart';

@LazySingleton(as: ApiService)
class TelleoApiService implements ApiService {
  TelleoApiService(this.apiGateway, this.tokenService);

  final ApiGateway apiGateway;
  final TokenService tokenService;

  String getEndpoint(String relPath) {
    return Config.apiUrl + relPath;
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
      case 206:
        return const ApiFailure.invalidRefreshToken();
      case 300:
        return const ApiFailure.userNotFound();
      default:
        return const ApiFailure.unknownError();
    }
  }

  bool isAccessTokenExpired(int code) {
    if (code == 205) {
      //accessToken is expired
      app.get<ILogger>().logError('Access token expired.');
      return true;
    }
    return false;
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> delete(
      {required String path, Map<String, dynamic>? data}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  Future<void> refreshAccessToken() async {
    app.get<ILogger>().logInfo('Refresing access token.');

    final refreshToken = await tokenService.getRefreshToken();
    final response = await post(
      path: '/auth/v${Config.authVersion}/token',
      data: {'refreshToken': refreshToken},
    );

    await response.fold((failure) async {
      failure.maybeWhen(invalidRefreshToken: () {
        app.get<ILogger>().logError('Invalid Refresh Token.');
      }, orElse: () {
        app.get<ILogger>().logError('Uncaught failure.');
      });
    }, (json) async {
      final accessToken = json['accessToken'] as String;
      await tokenService.storeAccessToken(accessToken);
      app.get<ILogger>().logInfo('Got new access token.');

      app.get<ILogger>().logInfo(accessToken);
    });
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> get(
      {required String path}) async {
    final accessToken = await tokenService.getAccessToken();

    final response = await apiGateway.get(
      endpoint: getEndpoint(path),
      header: {
        'Content-Type': 'application/json',
        'authorization': 'BEARER $accessToken'
      },
    );
    app.get<ILogger>().logInfo(response.toString());

    final error = response['error'];
    if (error != null) {
      if (error as bool) {
        final code = response['code'] as int;
        if (isAccessTokenExpired(code)) {
          await refreshAccessToken();
          // return await get(path: path);
          return left(const ApiFailure.internalServerError());
        } else {
          return left(
            getFailureFromCode(code),
          );
        }
      } else {
        return right(response);
      }
    }
    return right(response);
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> post(
      {required String path, required Map<String, dynamic> data}) async {
    final accessToken = await tokenService.getAccessToken();

    final response = await apiGateway.post(
        endpoint: getEndpoint(path),
        header: {
          'Content-Type': 'application/json',
          'authorization': 'BEARER $accessToken'
        },
        body: data);
    app.get<ILogger>().logInfo(response.toString());

    final error = response['error'];
    if (error != null) {
      if (error as bool) {
        final code = response['code'] as int;
        if (isAccessTokenExpired(code)) {
          await refreshAccessToken();

          // return await post(path: path, data: data);
          return left(const ApiFailure.internalServerError());
        } else {
          return left(
            getFailureFromCode(code),
          );
        }
      } else {
        return right(response);
      }
    }
    return right(response);
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> update(
      {required String path, required Map<String, dynamic> data}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
