import 'package:injectable/injectable.dart';
import '../../domain/core/services/api_service/api_service.dart';
import '../../domain/core/services/logger.dart';
import '../../utils/dependencies.dart';
import '../../config.dart';
import '../../domain/core/gateways/local_storage.dart';
import '../../domain/core/services/token_service/token_service.dart';

@LazySingleton(as: TokenService)
class TelleoTokenService implements TokenService {
  final LocalStorage localStorage;

  TelleoTokenService(this.localStorage);

  String? _accessToken;

  @override
  Future<String?> getAccessToken() async {
    return _accessToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    return await localStorage.read('refreshToken');
  }

  @override
  Future<bool> storeAccessToken(String accessToken) async {
    _accessToken = accessToken;
    return true;
  }

  @override
  Future<bool> storeRefreshToken(String refreshToken) async {
    return await localStorage.store('refreshToken', refreshToken);
  }
}
