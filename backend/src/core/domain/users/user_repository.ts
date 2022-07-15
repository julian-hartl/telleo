import { Either, Option } from "funpjs";
import UserEntity from "./user_entity";
import UserFailure from "./user_failure";

export type UserQueryOptions = {
  email?: string;
  token?: string;
  uid?: string;
};

export type UserUpdateOptions = {
  password?: string;
  name?: string;
  pushFriend?: string;
};

export default interface UserRepository {
  getUser(
    query: UserQueryOptions
  ): Promise<Either<UserFailure, Option<UserEntity>>>;
  createUser(
    email: string,
    password: string
  ): Promise<Either<UserFailure, UserEntity>>;
  exists(query: UserQueryOptions): Promise<boolean>;
  getAllUsers(): Promise<UserEntity[]>;
  searchUsers(query: string): Promise<UserEntity[]>;
  updateUser(
    id: string,
    options: UserUpdateOptions
  ): Promise<Either<UserFailure, UserEntity>>;
}
