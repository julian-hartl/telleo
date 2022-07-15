import { NextFunction, Request, Response } from "express";
import log from "../../../core/data/logging/log";
import TelleoUserModel from "../../../core/data/users/telleo_user_model";
import TelleoError from "../../../core/domain/errors/custom_error";
import UserRepository from "../../../core/domain/users/user_repository";

export default class UserController {
  public constructor(private readonly userRepository: UserRepository) {}

  use(req: Request, res: Response, next: NextFunction): UserControllerInternal {
    return new UserControllerInternal(req, res, next, this.userRepository);
  }
}
class UserControllerInternal {
  public constructor(
    private readonly req: Request,
    private readonly res: Response,
    private readonly next: NextFunction,
    private readonly userRepository: UserRepository
  ) {}

  async updateUser(): Promise<void> {
    try {
      const { uid, name } = this.req.body;
      if (!uid) {
        return this.next(TelleoError.missingProperty("uid"));
      }
      const result = await this.userRepository.updateUser(uid, {
        name,
      });
      result.fold(
        (l) => this.next(TelleoError.fromFailure(l)),
        (user) =>
          this.res.json({
            error: false,
            user: TelleoUserModel.fromEntity(user),
          })
      );
    } catch (e) {
      log.error(e);
      return this.next(TelleoError.internalServerError());
    }
  }

  async getUserByEmail(): Promise<void> {
    try {
      const email = this.req.params.email;
      if (!email) {
        return this.next(TelleoError.missingProperty("email"));
      }
      const userResult = await this.userRepository.getUser({
        email,
      });

      return userResult.fold(
        (failure) => {
          return this.next(TelleoError.fromFailure(failure));
        },
        (user) => {
          user.fold(
            () => {
              return this.next(TelleoError.userNotFound());
            },
            (result) => {
              this.res.json({
                error: false,
                user: TelleoUserModel.fromEntity(result),
              });
            }
          );
        }
      );
    } catch (e) {
      log.error(e);
      return this.next(TelleoError.internalServerError());
    }
  }

  async searchUsers(): Promise<void> {
    try {
      const { query } = this.req.params;
      if (!query) {
        return this.next(TelleoError.missingProperty("query"));
      }
      const result = await this.userRepository.searchUsers(query);
      this.res.json({
        error: false,
        users: result.map((user) => TelleoUserModel.fromEntity(user)),
      });
    } catch (e) {
      return this.next(TelleoError.internalServerError());
    }
  }

  async getUserByToken(): Promise<void> {
    try {
      const token = this.req.params.token;
      if (!token) {
        return this.next(TelleoError.missingProperty("token"));
      }

      const userResult = await this.userRepository.getUser({
        token,
      });

      return userResult.fold(
        (failure) => {
          return this.next(TelleoError.fromFailure(failure));
        },
        (user) => {
          user.fold(
            () => {
              return this.next(TelleoError.userNotFound());
            },
            (result) => {
              this.res.json({
                error: false,
                user: TelleoUserModel.fromEntity(result),
              });
            }
          );
        }
      );
    } catch (e) {
      log.error(e);
      return this.next(TelleoError.internalServerError());
    }
  }

  async getAllUsers(): Promise<void> {
    try {
      const users = await this.userRepository.getAllUsers();
      this.res.json({
        error: false,
        users: TelleoUserModel.fromEntityList(users),
      });
    } catch (e) {
      log.error(e);
      return this.next(TelleoError.internalServerError());
    }
  }
}
