import { Failure } from "funpjs";

export default abstract class CustomFailure extends Failure {
  constructor(reason: string, public errorCode: number, public status: number) {
    super(reason);
  }
}
