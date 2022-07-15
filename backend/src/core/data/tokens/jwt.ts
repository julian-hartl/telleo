import jwt from "jsonwebtoken";
import { Either, left, right } from "funpjs";

import TokenFailure from "../../domain/tokens/token_failure";
import TokenService from "../../domain/tokens/token_service";
import log from "../logging/log";

export default class JWT implements TokenService {
  async decodeToken(
    token: string,
    secret: string
  ): Promise<Either<TokenFailure, object>> {
    try {
      const valid = await this.verify(token, secret);
      if (!valid) {
        return left(TokenFailure.expiredToken());
      }
      const result = jwt.decode(token, { json: true });
      if (result == null) {
        log.warning("Returned result from token decode was null.");

        return left(TokenFailure.expiredToken());
      }

      delete result.iat;
      delete result.exp;
      return right(result);
    } catch (e) {
      log.error(e);
      return left(TokenFailure.internalError());
    }
  }
  async verify(token: string, secret: string): Promise<boolean> {
    try {
      jwt.verify(token, secret);
      return true;
    } catch (_) {
      log.warning("Token " + token + " has expired.");
      return false;
    }
  }
  async generateToken(
    payload: object,
    secret: string,
    expiresIn?: number
  ): Promise<string> {
    if (expiresIn) {
      return jwt.sign(payload, secret, { expiresIn: `${expiresIn}ms` });
    } else {
      return jwt.sign(payload, secret);
    }
  }
}
