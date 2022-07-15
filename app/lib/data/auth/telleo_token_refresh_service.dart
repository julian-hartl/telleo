import 'package:injectable/injectable.dart';
import '../../domain/core/services/api_service/api_service.dart';
import '../../domain/core/services/logger.dart';
import '../../domain/core/services/token_service/token_refresh_service.dart';
import '../../domain/core/services/token_service/token_service.dart';
import '../../utils/dependencies.dart';

import '../../config.dart';

@LazySingleton(as: RefreshTokenService)
class TelleoTokenRefreshService implements RefreshTokenService {
  final ApiService apiService;
  final TokenService tokenService;
  final ILogger logger;

  TelleoTokenRefreshService(this.apiService, this.tokenService, this.logger);

  @override
  Future<String?> refreshAccessToken() async {
    app.get<ILogger>().logInfo('Refreshing access token.');

    final refreshToken = await tokenService.getRefreshToken();
    final response = await apiService.post(
      path: '/auth/v${Config.authVersion}/token',
      data: {'refreshToken': refreshToken},
    );

    return await response.fold((failure) async {
      failure.maybeWhen(invalidRefreshToken: () {
        app.get<ILogger>().logError('Invalid Refresh Token.');
      }, orElse: () {
        app.get<ILogger>().logError('Uncaught failure.');
      });
      return null;
    }, (json) async {
      final accessToken = json['accessToken'] as String;
      await tokenService.storeAccessToken(accessToken);
      return accessToken;
    });
  }

  @override
  Future<bool> validateRefreshToken() async {
    final refreshToken = await tokenService.getRefreshToken();
    final response = await apiService.get(
        path: '${Config.apiPath}/tokens/verify',
        queryParameters: {'refreshToken': refreshToken!});

    return response.fold((failure) {
      logger.logError(failure);
      return false;
    }, (json) {
      final valid = json['valid'] as bool;
      return valid;
    });
  }
}
