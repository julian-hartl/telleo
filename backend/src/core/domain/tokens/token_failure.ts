import CustomFailure from "../errors/custom_failure";
import ErrorCodes from "../errors/error_codes";

export default class TokenFailure extends CustomFailure {
  private constructor(
    reason: string,
    public errorCode: number,
    public status: number
  ) {
    super(reason, errorCode, status);
  }

  static expiredToken(): TokenFailure {
    return new TokenFailure(
      "Token expired.",
      ErrorCodes.Auth.tokenExpired,
      401
    );
  }

  static internalError(): TokenFailure {
    return new TokenFailure(
      "Internal token decoding error.",
      ErrorCodes.internalServerError,
      502
    );
  }
}
