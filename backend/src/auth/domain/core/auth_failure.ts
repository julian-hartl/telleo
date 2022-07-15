import CustomFailure from "../../../core/domain/errors/custom_failure";
import ErrorCodes from "../../../core/domain/errors/error_codes";

export default class AuthFailure extends CustomFailure {
  static emailAlreadyInUse(): AuthFailure {
    return new AuthFailure(
      "Email already in use.",
      ErrorCodes.Auth.emailAlreadyInUse,
      409
    );
  }

  static invalidRefreshToken(): AuthFailure {
    return new AuthFailure(
      "Invalid refresh token.",
      ErrorCodes.Auth.invalidRefreshToken,
      400
    );
  }

  static invalidPassword(): AuthFailure {
    return new AuthFailure(
      "Invalid password.",
      ErrorCodes.Auth.invalidPassword,
      422
    );
  }
  static invalidEmail(): AuthFailure {
    return new AuthFailure("Invalid email.", ErrorCodes.Auth.invalidEmail, 422);
  }
  static emailNotFound(): AuthFailure {
    return new AuthFailure(
      "Email not found.",
      ErrorCodes.Auth.emailNotFound,
      409
    );
  }
  private constructor(reason: string, errorCode: number, status: number) {
    super(reason, errorCode, status);
  }
  static wrongPassword(): AuthFailure {
    return new AuthFailure(
      "Wrong password.",
      ErrorCodes.Auth.wrongPassword,
      422
    );
  }
}
