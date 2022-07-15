import { NextFunction, Request, Response } from "express";
import RefreshTokenRepository from "../../../auth/domain/tokens/refresh_token_repository";
import log from "../../../core/data/logging/log";
import TelleoError from "../../../core/domain/errors/custom_error";
import TokenService from "../../../core/domain/tokens/token_service";

export default class TokensController {
  public constructor(
    private readonly tokenService: TokenService,
    private readonly tokenRepository: RefreshTokenRepository
  ) {}

  use(
    req: Request,
    res: Response,
    next: NextFunction
  ): TokensControllerInternal {
    return new TokensControllerInternal(
      req,
      res,
      next,
      this.tokenService,
      this.tokenRepository
    );
  }
}

class TokensControllerInternal {
  public constructor(
    private readonly req: Request,
    private readonly res: Response,
    private readonly next: NextFunction,
    private readonly tokenService: TokenService,
    private readonly tokenRepository: RefreshTokenRepository
  ) {}

  async verify(): Promise<void> {
    try {
      const accessToken = this.req.query.accessToken as string | undefined;
      const refreshToken = this.req.query.refreshToken as string | undefined;
      if (accessToken) {
        const valid = await this.tokenService.verify(
          accessToken,
          process.env.ACCESS_TOKEN_SECRET!
        );
        this.res.json({
          error: false,
          valid,
        });
      } else if (refreshToken) {
        // eslint-disable-next-line security/detect-non-literal-fs-filename
        const exists = await this.tokenRepository.exists(refreshToken);
        if (exists) {
          const valid = await this.tokenService.verify(
            refreshToken,
            process.env.REFRESH_TOKEN_SECRET!
          );
          this.res.json({
            error: false,
            valid,
          });
        } else {
          this.res.json({
            error: false,
            valid: false,
          });
        }
      } else {
        return this.next(
          TelleoError.missingProperty("accessToken or refreshToken")
        );
      }
    } catch (e) {
      log.error(e);
      return this.next(TelleoError.internalServerError());
    }
  }
}
