import CustomFailure from "../errors/custom_failure";
import ErrorCodes from "../errors/error_codes";

export default class UserFailure extends CustomFailure {
  private constructor(reason: string, errorCode: number, status: number) {
    super(reason, errorCode, status);
  }

  static userNotFound(): UserFailure {
    return new UserFailure(
      "User not found.",
      ErrorCodes.Users.userNotFound,
      409
    );
  }

  static userAlreadyExists(): UserFailure {
    return new UserFailure(
      "User already exists.",
      ErrorCodes.Auth.emailAlreadyInUse,
      409
    );
  }
}
