import Bcrypt from "../encryption/bcrypt";

import TelleoAuthRepository from "./telleo_auth_repository";
import PasswordHashService from "../../domain/encryption/password_hash_service";

import RefreshTokenRepository from "../../domain/tokens/refresh_token_repository";
import AuthRepository from "../../domain/core/auth_repository";

import TelleoRefreshTokenRepository from "../tokens/telleo_refresh_token_repository";
import TokenService from "../../../core/domain/tokens/token_service";
import JWT from "../../../core/data/tokens/jwt";
import TelleoUserRepository from "../../../core/data/users/telleo_user_repository";
import UserRepository from "../../../core/domain/users/user_repository";

const passwordHashService: PasswordHashService = new Bcrypt();
const tokenService: TokenService = new JWT();
const userRepository: UserRepository = new TelleoUserRepository(tokenService);
const refreshTokenRepositoy: RefreshTokenRepository =
  new TelleoRefreshTokenRepository();
const authRepository: AuthRepository = new TelleoAuthRepository(
  userRepository,
  passwordHashService,
  tokenService,
  refreshTokenRepositoy
);
export default authRepository;
