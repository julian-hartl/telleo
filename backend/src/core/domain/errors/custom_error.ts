import CustomFailure from "./custom_failure";
import ErrorCodes from "./error_codes";

export default class TelleoError extends Error {
  private constructor(
    public message: string,
    public errorCode: number,
    public statusCode: number
  ) {
    super(message);
  }

  static fromFailure(failure: CustomFailure) {
    return new TelleoError(failure.reason, failure.errorCode, failure.status);
  }

  static badProperty(property: string, type: string): any {
    return new TelleoError(
      property + " is not of type " + type + " as required.",
      ErrorCodes.badProperty,
      400
    );
  }
  static expiredAccessToken(): TelleoError {
    return new TelleoError(
      "Access token expired.",
      ErrorCodes.Auth.tokenExpired,
      401
    );
  }

  static missingProperty(property: string): TelleoError {
    return new TelleoError(
      "Missing property " + property + ".",
      ErrorCodes.missingProperty,
      400
    );
  }

  static userNotFound(): TelleoError {
    return new TelleoError(
      "User not found.",
      ErrorCodes.Users.userNotFound,
      409
    );
  }

  static internalServerError(): TelleoError {
    return new TelleoError(
      "Internal server error.",
      ErrorCodes.internalServerError,
      502
    );
  }
}
