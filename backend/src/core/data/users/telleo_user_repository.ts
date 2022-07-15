import { Either, left, right, none, Option, some } from "funpjs";

import TokenFailure from "../../domain/tokens/token_failure";
import TokenService from "../../domain/tokens/token_service";
import UserEntity from "../../domain/users/user_entity";
import UserFailure from "../../domain/users/user_failure";
import UserRepository, {
  UserQueryOptions,
  UserUpdateOptions,
} from "../../domain/users/user_repository";
import log from "../logging/log";
import UserModel from "./mongoose_user_model";
import mongoose from "mongoose";

export default class TelleoUserRepository implements UserRepository {
  constructor(private readonly tokenService: TokenService) {}
  async updateUser(
    id: string,
    options: UserUpdateOptions
  ): Promise<Either<UserFailure, UserEntity>> {
    const result = await UserModel.findByIdAndUpdate(
      id,
      {
        name: options.name,
        password: options.password,
        $push: {
          friends: options.pushFriend
            ? new mongoose.Types.ObjectId(options.pushFriend)
            : undefined,
        },
      },
      { new: true }
    );
    if (result === null) {
      return left(UserFailure.userNotFound());
    }
    const updatedUser = await result.mapToUserEntity();
    log.info("Updated user:" + JSON.stringify(updatedUser));
    return right(updatedUser);
  }

  async searchUsers(query: string): Promise<UserEntity[]> {
    const result = await UserModel.find({
      email: {
        $regex: query,
        $options: "i",
      },
    });

    return await Promise.all(
      result.map(async (user) => await user.mapToUserEntity())
    );
  }
  async getAllUsers(): Promise<UserEntity[]> {
    const users = await UserModel.find();
    return await Promise.all(
      users.map(async (user) => await user.mapToUserEntity())
    );
  }
  async getUser(
    query: UserQueryOptions
  ): Promise<Either<UserFailure, Option<UserEntity>>> {
    const token = query.token;
    if (token) {
      log.info("Getting user by token: " + token);
      const decodedResult = await this.tokenService.decodeToken(
        token,
        process.env.ACCESS_TOKEN_SECRET!
      );
      return await decodedResult.fold(
        async (f: TokenFailure) => {
          return left<UserFailure, Option<UserEntity>>(f);
        },
        async (decoded: any) => {
          const id: string = decoded.id;
          const user = await (await UserModel.findById(id))?.mapToUserEntity();
          if (user != null) {
            return right<UserFailure, Option<UserEntity>>(some(user));
          }
          return right<UserFailure, Option<UserEntity>>(none<UserEntity>());
        }
      );
    } else {
      const email = query.email;
      if (email) {
        const user = await (
          await UserModel.findOne({ email })
        )?.mapToUserEntity();
        if (user != null) {
          return right<UserFailure, Option<UserEntity>>(some(user));
        }
        return right<UserFailure, Option<UserEntity>>(none<UserEntity>());
      }
      const uid = query.uid;
      if (!uid) {
        throw Error("Missing property email, token or uid.");
      }
      const user = await (await UserModel.findById(uid))?.mapToUserEntity();
      if (user !== undefined) {
        return right<UserFailure, Option<UserEntity>>(some(user));
      }
      return right<UserFailure, Option<UserEntity>>(none<UserEntity>());
    }
  }

  async exists(query: UserQueryOptions): Promise<boolean> {
    const user = await this.getUser(query);
    return user.fold(
      (l) => false,
      (r) => r.isSome()
    );
  }

  async createUser(
    email: string,
    password: string
  ): Promise<Either<UserFailure, UserEntity>> {
    // eslint-disable-next-line security/detect-non-literal-fs-filename
    const exists = await this.exists({ email });
    if (exists) {
      return left(UserFailure.userAlreadyExists());
    }
    const userModel = new UserModel({
      email,
      password,
    });
    const user = await userModel.save();
    return right(await user.mapToUserEntity());
  }
}
