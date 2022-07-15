import { Either } from "funpjs";
import TokenFailure from "./token_failure";

export default interface TokenService {
  generateToken(
    payload: object,
    secret: string,
    expiresInMs?: number
  ): Promise<string>;
  decodeToken(
    token: string,
    secret: string
  ): Promise<Either<TokenFailure, object>>;
  verify(token: string, secret: string): Promise<boolean>;
}
