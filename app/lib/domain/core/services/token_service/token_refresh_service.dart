abstract class RefreshTokenService {
  Future<String?> refreshAccessToken();
  Future<bool> validateRefreshToken();
}
