import CustomFailure from "../core/domain/errors/custom_failure";
import ErrorCodes from "../core/domain/errors/error_codes";
import UserFailure from "../core/domain/users/user_failure";

export default class FriendRequestFailure extends CustomFailure {
  static userNotFound(): FriendRequestFailure {
    return UserFailure.userNotFound();
  }
  static userAlreadyFriend(): FriendRequestFailure {
    return new FriendRequestFailure(
      "Users are already friends.",
      ErrorCodes.Friends.alreadyFriends,
      400
    );
  }
}
