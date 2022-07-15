import { left, right, Option, Either } from "funpjs";

import log from "../../../core/data/logging/log";
import TokensEntity from "../../../core/domain/tokens/tokens_entity";
import TokenService from "../../../core/domain/tokens/token_service";
import UserRepository from "../../../core/domain/users/user_repository";
import AuthFailure from "../../domain/core/auth_failure";
import AuthRepository from "../../domain/core/auth_repository";
import AuthResult from "../../domain/core/auth_result";
import {
  validateEmail,
  validatePassword,
} from "../../domain/core/auth_validators";
import PasswordHashService from "../../domain/encryption/password_hash_service";
import RefreshTokenRepository from "../../domain/tokens/refresh_token_repository";

export default class TelleoAuthRepository implements AuthRepository {
  constructor(
    private readonly userRepository: UserRepository,
    private readonly passwordHashService: PasswordHashService,
    private readonly tokenService: TokenService,
    private readonly refreshTokenRepositoy: RefreshTokenRepository
  ) {}
  async refreshAccessToken(
    refreshToken: string
  ): Promise<Either<AuthFailure, string>> {
    const decodedRefreshToken = await this.tokenService.decodeToken(
      refreshToken,
      process.env.REFRESH_TOKEN_SECRET!
    );
    return decodedRefreshToken.fold(
      async (l) => {
        return left<AuthFailure, string>(AuthFailure.invalidRefreshToken());
      },
      async (result: any) => {
        const accessToken = await this.tokenService.generateToken(
          {
            id: result.id,
          },
          process.env.ACCESS_TOKEN_SECRET!,
          Number.parseInt(process.env.ACCESS_TOKEN_EXPIRES_IN!)
        );
        return right(accessToken);
      }
    );
  }

  async signUpWithEmailAndPassword(
    email: string,
    password: string
  ): Promise<Either<AuthFailure, AuthResult>> {
    log.info(`Signing up with {email: ${email}, password: ${password}}!`);
    log.info("Validating email and password...");
    const emailIsValid = validateEmail(email);
    if (!emailIsValid) {
      log.warning("Provided email is invalid.");
      return left(AuthFailure.invalidEmail());
    }
    const passwordIsValid = validatePassword(password);
    if (!passwordIsValid) {
      log.warning("Provided password is invalid.");

      return left(AuthFailure.invalidPassword());
    }
    const hashedPassword = await this.passwordHashService.hash(password);
    log.info("Creating user with hashed password " + hashedPassword + "...");

    const createdUserResult = await this.userRepository.createUser(
      email,
      hashedPassword
    );
    return await createdUserResult.fold(
      async (f) => {
        log.warning("User already exists!");
        return left(AuthFailure.emailAlreadyInUse());
      },
      async (user) => {
        log.info("Created user successfully!");
        log.info("Generating tokens...");
        const accessToken = await this.tokenService.generateToken(
          { id: user.id },
          process.env.ACCESS_TOKEN_SECRET!,
          Number.parseInt(process.env.ACCESS_TOKEN_EXPIRES_IN!)
        );
        const refreshToken = await this.tokenService.generateToken(
          { id: user.id },
          process.env.REFRESH_TOKEN_SECRET!
        );
        const tokens = new TokensEntity(accessToken, refreshToken);

        log.info("Generated tokens: " + tokens);
        log.info("Storing refreshToken...");

        const refreshTokenResult = await this.refreshTokenRepositoy.save(
          refreshToken
        );
        refreshTokenResult.fold(
          () => {
            log.warning("Refreshtoken already exists.");
          },
          (r) => {
            log.info("Stored refreshToken!");
          }
        );
        log.info("SIGN UP ENDED SUCCESSFULLY.");
        return right<AuthFailure, AuthResult>(new AuthResult(user, tokens));
      }
    );
  }
  async signInWithEmailAndPassword(
    email: string,
    password: string
  ): Promise<Either<AuthFailure, AuthResult>> {
    log.info(`Signing in with {email: ${email}, password: ${password}} !`);

    log.info("Getting user...");
    const userResult = await this.userRepository.getUser({ email: email });
    return await userResult.fold(
      async (failure) => {
        log.error("This should not happen.");
        return left<AuthFailure, AuthResult>(failure);
      },
      async (userOption) => {
        return await userOption.fold(
          async () => {
            log.warning("User with this email does not exist.");
            return left<AuthFailure, AuthResult>(AuthFailure.emailNotFound());
          },
          async (user) => {
            log.info("Got user!");
            log.info("Checking if password is correct...");
            const correctPassword = await this.passwordHashService.compare(
              user.password,
              password
            );

            if (correctPassword) {
              log.info("Password is correct!");
              log.info("Generating tokens...");
              const accessToken = await this.tokenService.generateToken(
                { id: user.id },
                process.env.ACCESS_TOKEN_SECRET!,
                Number.parseInt(process.env.ACCESS_TOKEN_EXPIRES_IN!)
              );
              const refreshToken = await this.tokenService.generateToken(
                { id: user.id },
                process.env.REFRESH_TOKEN_SECRET!
              );
              log.info("Generated tokens!");
              log.info("Saving refreshToken...");
              // eslint-disable-next-line security/detect-non-literal-fs-filename
              const existsResult: Option<string> =
                await this.refreshTokenRepositoy.save(refreshToken);
              existsResult.fold(
                () => {
                  log.warning("Refreshtoken already exists.");
                },
                (_) => {
                  log.info("Refreshtoken was saved.");
                }
              );
              log.info("SIGN IN ENDED SUCCESSFULLY.");
              return right<AuthFailure, AuthResult>(
                new AuthResult(
                  user,
                  new TokensEntity(accessToken, refreshToken)
                )
              );
            } else {
              log.warning("Password is not correct!");
              return left<AuthFailure, AuthResult>(AuthFailure.wrongPassword());
            }
          }
        );
      }
    );
  }
}
