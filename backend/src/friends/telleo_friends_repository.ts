import { Either, left, right, Unit, unit } from "funpjs";
import chatsRepository from "../api/chats/data/chat_repository";
import ChatsRepository from "../api/chats/domain/chats_repository";
import userRepository from "../core/data/users/user_repository";
import UserRepository from "../core/domain/users/user_repository";
import FriendsRepository from "./friends_repository";
import FriendRequestFailure from "./friend_request_failure";

export class TelleoFriendRepository implements FriendsRepository {
  constructor(
    private readonly userRepository: UserRepository,
    private readonly chatsRepository: ChatsRepository
  ) {}

  async isFriendWith(
    who: string,
    whom: string
  ): Promise<Either<FriendRequestFailure, boolean>> {
    const userResult = await this.userRepository.getUser({ uid: who });
    return userResult.fold(
      (l) => left(l),
      (userOption) => {
        return userOption.fold(
          () => left(FriendRequestFailure.userNotFound()),
          (user) => {
            for (const friend of user.friends) {
              if (whom === friend) {
                return right(true);
              }
            }
            return right(false);
          }
        );
      }
    );
  }
  async addFriend(
    who: string,
    whom: string
  ): Promise<Either<FriendRequestFailure, Unit>> {
    const userResult = await this.userRepository.getUser({ uid: who });
    const userAlreadyFriendResult = userResult.fold(
      (failure) => {
        return left(failure);
      },
      (userOption) => {
        return userOption.fold(
          () => {
            return left(FriendRequestFailure.userNotFound());
          },
          (user) => {
            if (user.friends.map((friend) => friend).includes(whom)) {
              return left(FriendRequestFailure.userAlreadyFriend());
            }
            return right(user);
          }
        );
      }
    );
    return await userAlreadyFriendResult.fold(
      async (l) => left<FriendRequestFailure, Unit>(l),
      async (_) => {
        const updateUserResult = await this.userRepository.updateUser(who, {
          pushFriend: whom,
        });
        return await updateUserResult.fold(
          async (failure) => {
            return left<FriendRequestFailure, Unit>(failure);
          },
          async (user) => {
            const createChatResult = await this.chatsRepository.createChat([
              who,
              whom,
            ]);
            return await createChatResult.fold(
              async (failure) => {
                return left<FriendRequestFailure, Unit>(failure);
              },
              async (chat) => {
                return right<FriendRequestFailure, Unit>(unit);
              }
            );
          }
        );
      }
    );
  }
  removeFriend(
    who: string,
    whom: string
  ): Promise<Either<FriendRequestFailure, Unit>> {
    throw new Error("Method not implemented.");
  }
}

const friendsRepository = new TelleoFriendRepository(
  userRepository,
  chatsRepository
);
export default friendsRepository;
