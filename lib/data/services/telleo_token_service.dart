import 'package:injectable/injectable.dart';
import '../../domain/core/gateways/local_storage.dart';
import '../../domain/core/services/token_service/token_service.dart';

@LazySingleton(as: TokenService)
class TelleoTokenService implements TokenService {
  final LocalStorage localStorage;

  TelleoTokenService(this.localStorage);

  @override
  Future<String?> getAccessToken() async {
    return await localStorage.read('accessToken');
  }

  @override
  Future<String?> getRefreshToken() async {
    return await localStorage.read('refreshToken');
  }

  @override
  Future<bool> storeAccessToken(String accessToken) async {
    return await localStorage.store('accessToken', accessToken);
  }

  @override
  Future<bool> storeRefreshToken(String refreshToken) async {
    return await localStorage.store('refreshToken', refreshToken);
  }
}
