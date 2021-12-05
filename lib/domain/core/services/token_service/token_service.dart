abstract class TokenService {
  Future<bool> storeRefreshToken(String refreshToken);
  Future<bool> storeAccessToken(String accessToken);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}
