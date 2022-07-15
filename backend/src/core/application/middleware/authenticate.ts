import passport from "passport";
import bearer from "passport-http-bearer";
import log from "../../data/logging/log";
import TelleoError from "../../domain/errors/custom_error";
import UserRepository from "../../domain/users/user_repository";

export default function authenticate() {
  return passport.authenticate("bearer", { session: false });
}

export function initAuthentication(userRepository: UserRepository) {
  return new bearer.Strategy(async (token, done) => {
    try {
      const userResult = await userRepository.getUser({ token });
      return userResult.fold(
        (failure) => {
          return done(TelleoError.fromFailure(failure), false);
        },
        (user) => {
          return user.fold(
            () => {
              return done(null, false);
            },
            (r) => {
              return done(null, { user: r });
            }
          );
        }
      );
    } catch (e) {
      log.error(e);
      done(e, false);
    }
  });
}
