import CustomFailure from "../../../core/domain/errors/custom_failure";

export default class RefreshTokenFailure extends CustomFailure {
  private constructor(reason: string, errorCode: number, status: number) {
    super(reason, errorCode, status);
  }
}
