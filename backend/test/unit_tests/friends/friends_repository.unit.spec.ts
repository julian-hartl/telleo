import { expect } from "chai";
import FriendsRepository from "../../../src/friends/friends_repository";
import { TelleoFriendRepository } from "../../../src/friends/telleo_friends_repository";
import MemoryDB from "../../helpers/memory_db.test_helper";
import {
  anyString,
  anything,
  deepEqual,
  instance,
  mock,
  reset,
  verify,
  when,
} from "ts-mockito";
import UserRepository from "../../../src/core/domain/users/user_repository";
import ChatsRepository from "../../../src/api/chats/domain/chats_repository";
import Database from "../../../src/core/domain/database/database";
import { left, right, unit, some } from "funpjs";
import UserFailure from "../../../src/core/domain/users/user_failure";
import ChatFailure from "../../../src/api/chats/domain/chat_failure";
import userRepository from "../../../src/core/data/users/user_repository";
import UserEntity from "../../../src/core/domain/users/user_entity";
import ChatEntity from "../../../src/api/chats/domain/chat_entity";
import _ from "lodash";
import log from "../../../src/core/data/logging/log";

const mockUserRepository = mock<UserRepository>();
const mockChatsRepository = mock<ChatsRepository>();

describe("FriendsRepository", () => {
  let testDb: Database;
  let sut: FriendsRepository;
  beforeEach(async () => {
    testDb = new MemoryDB();

    await testDb.connect();
    sut = new TelleoFriendRepository(
      instance(mockUserRepository),
      instance(mockChatsRepository)
    );
  });
  afterEach(async () => {
    await testDb.disconnect();
    reset(mockUserRepository);
    reset(mockChatsRepository);
  });

  const who: string = "CNEPqjZHXxNukrDUoHWewwMv";
  const whom: string = "CNEPqjZHXxNukrDUoHWewwNv";

  /*
  async function ensureWhoAndWhomExist(): Promise<void> {
    const whoResult = await userRepository.createUser(
      "it@sebow.ci",
      "VTtYcrVfHNeHoEywYklg"
    );
    const whomResult = await userRepository.createUser(
      "it@sebwow.ci",
      "VTtYcrVfHssNeHoEywYklg"
    );
    whoResult.fold(
      (failure) => {
        throw Error();
      },
      (user) => (who = user.id)
    );
    whomResult.fold(
      (failure) => {
        throw Error();
      },
      (user) => {
        whom = user.id;
      }
    );
  }
  */

  function emptyUser(): UserEntity {
    return new UserEntity("", "", "", "", "", []);
  }

  function addFriendsMocks() {
    when(mockUserRepository.getUser(anything())).thenResolve(
      right(some(emptyUser()))
    );

    when(mockUserRepository.updateUser(anything(), anything())).thenResolve(
      right(new UserEntity("", "", "", "", "", [whom]))
    );
    when(mockChatsRepository.createChat(anything())).thenResolve(
      right(
        new ChatEntity(
          [
            new UserEntity(who, "", "", "", "", []),
            new UserEntity(whom, "", "", "", "", []),
          ],
          "",
          []
        )
      )
    );
  }

  it("should be friends with someone that has just been added", async () => {
    when(mockUserRepository.getUser(anything())).thenResolve(
      right(some(new UserEntity("", "", "", "", "", [whom])))
    );
    const result = await sut.isFriendWith(who, whom);
    expect(result.isRight()).to.equal(true);

    result.fold(
      (l) => {
        throw Error();
      },
      (isFriendWith) => {
        expect(isFriendWith).to.equal(true);
      }
    );
  });

  it("should update the users friends and create a chat afterwards when a friend is added and no failure occurres", async () => {
    addFriendsMocks();

    const result = await sut.addFriend(who, whom);
    verify(
      mockUserRepository.updateUser(who, deepEqual({ pushFriend: whom }))
    ).calledBefore(mockChatsRepository.createChat(deepEqual([who, whom])));
    expect(_.isEqualWith(result, right(unit))).to.equal(true);
  });

  it("should return a failure when updateUser returns a failure", async () => {
    addFriendsMocks();

    when(mockUserRepository.updateUser(anyString(), anything())).thenResolve(
      left(UserFailure.userNotFound())
    );
    const result = await sut.addFriend(who, whom);
    expect(result.isLeft()).to.equal(true);
  });

  it("should return a failure when createChat returns a failure", async () => {
    addFriendsMocks();

    when(mockChatsRepository.createChat(anything())).thenResolve(
      left(ChatFailure.chatNotFound())
    );
    const result = await sut.addFriend(who, whom);
    expect(result.isLeft()).to.equal(true);
  });

  it("should not be friends with someone that has not been added", async () => {
    when(mockUserRepository.getUser(anything())).thenResolve(
      right(some(emptyUser()))
    );
    const result = await sut.isFriendWith(who, whom);
    log.info(JSON.stringify(result));
    log.info(result.isRight());

    result.fold(
      (l) => {
        throw Error();
      },
      (isFriendWith) => {
        expect(isFriendWith).to.equal(false);
      }
    );
  });
});
