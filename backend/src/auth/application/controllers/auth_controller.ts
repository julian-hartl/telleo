import { NextFunction, Request, Response } from "express";
import log from "../../../core/data/logging/log";
import TelleoUserModel from "../../../core/data/users/telleo_user_model";
import TelleoError from "../../../core/domain/errors/custom_error";
import TelleoTokensModel from "../../data/tokens/telleo_tokens_model";
import AuthRepository from "../../domain/core/auth_repository";

class AuthControllerInternal {
  public constructor(
    private readonly req: Request,
    private readonly res: Response,
    private readonly next: NextFunction,
    private readonly authRepository: AuthRepository
  ) {}
  async signup(): Promise<void> {
    try {
      const { email, password } = this.req.body;
      if (!email) {
        return this.next(TelleoError.missingProperty("email"));
      }
      if (!password) {
        return this.next(TelleoError.missingProperty("password"));
      }

      const signUpResult = await this.authRepository.signUpWithEmailAndPassword(
        email,
        password
      );

      signUpResult.fold(
        (f) => {
          return this.next(TelleoError.fromFailure(f));
        },
        (authResult) => {
          const user: TelleoUserModel = TelleoUserModel.fromEntity(
            authResult.user
          );
          const tokens: TelleoTokensModel = TelleoTokensModel.fromDomain(
            authResult.tokens
          );
          this.res.json({
            error: false,
            user: user,
            tokens: tokens,
          });
        }
      );
    } catch (e) {
      log.error(e);

      return this.next(TelleoError.internalServerError());
    }
  }

  async refreshAccessToken(): Promise<void> {
    try {
      const { refreshToken } = this.req.body;
      if (!refreshToken) {
        return this.next(TelleoError.missingProperty("refreshToken"));
      }

      const accessTokenResult = await this.authRepository.refreshAccessToken(
        refreshToken
      );
      accessTokenResult.fold(
        (failure) => {
          return this.next(TelleoError.fromFailure(failure));
        },
        (accessToken) => {
          this.res.json({
            error: false,
            accessToken,
          });
        }
      );
    } catch (e) {
      log.error(e);
      this.next(TelleoError.internalServerError());
    }
  }

  async signin(): Promise<void> {
    try {
      const { email, password } = this.req.body;

      if (!email) {
        return this.next(TelleoError.missingProperty("email"));
      }
      if (!password) {
        return this.next(TelleoError.missingProperty("password"));
      }

      const signInResult = await this.authRepository.signInWithEmailAndPassword(
        email,
        password
      );

      signInResult.fold(
        (f) => {
          return this.next(TelleoError.fromFailure(f));
        },
        (authResult) => {
          const user: TelleoUserModel = TelleoUserModel.fromEntity(
            authResult.user
          );
          const tokens: TelleoTokensModel = TelleoTokensModel.fromDomain(
            authResult.tokens
          );
          this.res.json({
            error: false,
            user: user,
            tokens: tokens,
          });
        }
      );
    } catch (e) {
      log.error(e);
      return this.next(TelleoError.internalServerError());
    }
  }

  async googleSignin(): Promise<void> {
    return this.next(TelleoError.internalServerError());
  }
}

export default class AuthController {
  public constructor(private readonly authRepository: AuthRepository) {}

  use(req: Request, res: Response, next: NextFunction): AuthControllerInternal {
    return new AuthControllerInternal(req, res, next, this.authRepository);
  }
}
