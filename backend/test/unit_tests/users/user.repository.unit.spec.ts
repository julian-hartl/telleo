import dotenv from "dotenv";
dotenv.config();

import { anyString, instance, reset, verify, when } from "ts-mockito";

import { expect } from "chai";
import _ from "lodash";

import MemoryDB from "../../helpers/memory_db.test_helper";
import UserRepository from "../../../src/core/domain/users/user_repository";
import TelleoUserRepository from "../../../src/core/data/users/telleo_user_repository";
import Database from "../../../src/core/domain/database/database";
import JWT from "../../../src/core/data/tokens/jwt";

import { right } from "funpjs";
import UserEntity from "../../../src/core/domain/users/user_entity";
import { mockTokenService } from "../helpers/mocks.test_helper";
import { log } from "winston";
import { Types } from "mongoose";

describe("UserRepository", () => {
  let sut: UserRepository;
  let testDb: Database;
  beforeEach(async () => {
    testDb = new MemoryDB();
    const dbResult = await testDb.connect();
    dbResult.fold(
      (l) => {
        throw Error(l.reason);
      },
      (r) => {}
    );
    sut = new TelleoUserRepository(instance(mockTokenService));
  });
  afterEach(async () => {
    await testDb.disconnect();
    reset(mockTokenService);
  });

  async function createUserOrCrash(
    email: string,
    password: string
  ): Promise<UserEntity> {
    const result = await sut.createUser(email, password);
    return result.fold(
      (_) => {
        throw Error();
      },
      (user) => user
    );
  }

  it("should get the user by email that was created before", async () => {
    const email = "nil@ebesi.be";
    const password = "tfWivpQHAoIsrvfoHVgF";

    const createdUserResult = await sut.createUser(email, password);
    const userResult = await sut.getUser({ email });

    expect(createdUserResult.isRight()).to.equal(true);
    expect(userResult.isRight()).to.equal(true);

    createdUserResult.fold(
      (l) => {},
      (createdUser) => {
        console.log(createdUser);
        userResult.fold(
          (f) => {
            throw Error();
          },
          (userOption) => {
            expect(userOption.isSome()).to.equal(true);
            userOption.fold(
              () => {
                throw Error();
              },
              (user) => {
                expect(_.isEqualWith(user.id, createdUser.id)).to.equal(true);
              }
            );
          }
        );
      }
    );
  });
  it("should return the updated user", async () => {
    const email = "nil@ebes.be";
    const password = "tfWivpQHAoIsrvfoHVgF";
    const updatedPassword = "dUyjrOfzlTOWgNQbWPMO";
    const updatedName = "Delia James";

    const user = await createUserOrCrash(email, password);
    const friend = await createUserOrCrash(
      "watefu@uzu.ca",
      "CeXAYQLXowvTrZruRtUM"
    );
    const updateUserResult = await sut.updateUser(user.id, {
      password: updatedPassword,
      name: updatedName,
      pushFriend: friend.id,
    });
    expect(updateUserResult.isRight()).to.equal(true);
    updateUserResult.fold(
      (l) => {
        throw Error();
      },
      (updatedUser) => {
        expect(updatedUser.password).to.equal(updatedPassword);
        expect(updatedUser.name).to.equal(updatedName);
        const friendsIds = updatedUser.friends;
        console.log(friendsIds);
        expect(friendsIds).to.contain(friend.id);
      }
    );
  });

  it("should return none when user does not exist", async () => {
    const result = await sut.getUser({
      uid: new Types.ObjectId("UFBKSRGKiggF").toHexString(),
    });
    expect(result.isRight()).to.equal(true);
    result.fold(
      (l) => {
        throw Error();
      },
      (r) => {
        expect(r.isNone()).to.equal(true);
      }
    );
  });

  it("should get the user by token that was created before", async () => {
    const email = "nil@ebes.be";
    const password = "tfWivpQHAoIsrvfoHVgF";
    const secret = process.env.ACCESS_TOKEN_SECRET!;
    // expect(true).to.equal(false);
    const createdUserResult = await sut.createUser(email, password);
    expect(createdUserResult.isRight()).to.equal(true);

    await createdUserResult.fold(
      async (l) => {},
      async (createdUser) => {
        const token = await new JWT().generateToken(
          { id: createdUser.id },
          secret
        );
        when(
          mockTokenService.decodeToken(anyString(), anyString())
        ).thenResolve(
          right({
            id: createdUser.id,
          })
        );

        // expect(true).to.equal(false);

        const userResult = await sut.getUser({ token });
        verify(mockTokenService.decodeToken(token, secret)).once();

        expect(userResult.isRight()).to.equal(true);
        userResult.fold(
          (f) => {},
          (userOption) => {
            expect(userOption.isSome()).to.equal(true);
            userOption.fold(
              () => {},
              (user) => {
                expect(_.isEqualWith(user.id, createdUser.id)).to.equal(true);
              }
            );
          }
        );
      }
    );
  });
});
