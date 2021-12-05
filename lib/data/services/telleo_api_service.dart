import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/config.dart';
import 'package:telleo/domain/auth/auth_failure.dart';
import 'package:telleo/domain/core/gateways/api_gateway.dart';
import 'package:telleo/domain/core/gateways/local_storage.dart';
import 'package:telleo/domain/core/services/logger.dart';
import 'package:telleo/domain/core/services/token_service/token_service.dart';
import 'package:telleo/utils/dependencies.dart';

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
      case 300:
        return const ApiFailure.userNotFound();
      default:
        return const ApiFailure.unknownError();
    }
  }

  bool validateReponse(int code) {
    if (code == 205) {
      //accessToken is expired
      app.get<ILogger>().logError('Access token expired.');
      return false;
    }
    return true;
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> delete(
      {required String path, Map<String, dynamic>? data}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  Future<void> refreshAccessToken() async {
    final refreshToken = await tokenService.getRefreshToken();
    final response = await post(
      path: '/auth/v${Config.authVersion}/token',
      data: {'refreshToken': refreshToken},
    );
    response.fold((failure) {
      failure.maybeWhen(orElse: () {
        app.get<ILogger>().logError('Uncaught failure.');
        throw Error();
      });
    }, (json) async {
      final accessToken = json['accessToken'] as String;
      await tokenService.storeAccessToken(accessToken);
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
    final error = response['error'];
    if (error != null) {
      if (error as bool) {
        final code = response['code'] as int;
        if (validateReponse(code)) {
          return left(
            getFailureFromCode(code),
          );
        } else {
          await refreshAccessToken();
          return await get(path: path);
        }
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
    final error = response['error'];
    if (error != null) {
      if (error as bool) {
        final code = response['code'] as int;
        if (validateReponse(code)) {
          return left(
            getFailureFromCode(code),
          );
        } else {
          await refreshAccessToken();
          return await post(path: path, data: data);
        }
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
