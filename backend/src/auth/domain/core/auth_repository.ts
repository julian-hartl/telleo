import { Either } from "funpjs";
import AuthFailure from "./auth_failure";
import AuthResult from "./auth_result";

export default interface AuthRepository {
  signUpWithEmailAndPassword(
    email: string,
    password: string
  ): Promise<Either<AuthFailure, AuthResult>>;
  signInWithEmailAndPassword(
    email: string,
    password: string
  ): Promise<Either<AuthFailure, AuthResult>>;
  refreshAccessToken(
    refreshToken: string
  ): Promise<Either<AuthFailure, string>>;
  // signUpWithGoogle(): Promise<Either<AuthFailure, UserEntity>>;
}
