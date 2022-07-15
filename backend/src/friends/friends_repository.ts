import { Unit, Either } from "funpjs";
import FriendRequestFailure from "./friend_request_failure";

export default interface FriendsRepository {
  addFriend(
    who: string,
    whom: string
  ): Promise<Either<FriendRequestFailure, Unit>>;
  removeFriend(
    who: string,
    whom: string
  ): Promise<Either<FriendRequestFailure, Unit>>;
  isFriendWith(
    who: string,
    whom: string
  ): Promise<Either<FriendRequestFailure, boolean>>;
}
