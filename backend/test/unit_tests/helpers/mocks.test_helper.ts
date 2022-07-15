import { mock } from "ts-mockito";
import TokenService from "../../../src/core/domain/tokens/token_service";
import UserRepository from "../../../src/core/domain/users/user_repository";
import PasswordHashService from "../../../src/auth/domain/encryption/password_hash_service";
import RefreshTokenRepository from "../../../src/auth/domain/tokens/refresh_token_repository";

export const mockUserRepository: UserRepository = mock<UserRepository>();
export const mockPasswordHashService: PasswordHashService =
  mock<PasswordHashService>();
export const mockTokenService: TokenService = mock<TokenService>();
export const mockRefreshTokenRepository: RefreshTokenRepository =
  mock<RefreshTokenRepository>();
