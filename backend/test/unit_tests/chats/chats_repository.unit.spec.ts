import { expect } from "chai";

import MemoryDB from "../../helpers/memory_db.test_helper";

import _ from "lodash";
import ChatsRepository from "../../../src/api/chats/domain/chats_repository";
import Database from "../../../src/core/domain/database/database";
import TelleoUserRepository from "../../../src/core/data/users/telleo_user_repository";
import JWT from "../../../src/core/data/tokens/jwt";
import UserRepository from "../../../src/core/domain/users/user_repository";
import TelleoChatsRepository from "../../../src/api/chats/data/telleo_chat_repository";

describe("ChatsRepository", () => {
  let sut: ChatsRepository;
  let testDb: Database;
  let userRepository: UserRepository;

  beforeEach(async () => {
    userRepository = new TelleoUserRepository(new JWT());

    sut = new TelleoChatsRepository(userRepository);
    testDb = new MemoryDB();
    const dbResult = await testDb.connect();
    dbResult.fold(
      (l) => {
        throw Error(l.reason);
      },
      (r) => {}
    );
  });
  afterEach(async () => {
    await testDb.disconnect();
  });
  it("should return a chat that has been created before with two users that equal to the ones that have been created before", async () => {
    const email1 = "wo@jedef.pl";
    const email2 = "wo@jedefwww.pl";
    const userResult1 = await userRepository.createUser(email1, "ejlwkjlfkwjl");
    const userResult2 = await userRepository.createUser(email2, "ejlwkjlfkwjl");
    const user1 = userResult1.fold(
      (l) => {
        throw Error();
      },
      (r) => r
    );
    const user2 = userResult2.fold(
      (l) => {
        throw Error();
      },
      (r) => r
    );
    // const spiedChatRepository = spy(sut);

    const createdChatResult = await sut.createChat([user1.id, user2.id]);
    expect(createdChatResult.isRight()).to.equal(true);

    await createdChatResult.fold(
      async (l) => {},
      async (createdChat) => {
        expect(_.isEqualWith(createdChat.users, [user1, user2]));
        const chatResult1 = await sut.getChat(createdChat.id);
        expect(chatResult1.isRight()).to.equal(true);
      }
    );

    const chatResult = await sut.getChats(user1.id);
    expect(chatResult.length).to.be.greaterThan(0);
  });
});
