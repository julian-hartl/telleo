import { expect } from "chai";
import dotenv from "dotenv";
dotenv.config();

import { left, none, right, some } from "funpjs";
import _ from "lodash";
import {
  anyNumber,
  anyString,
  anything,
  instance,
  reset,
  verify,
  when,
} from "ts-mockito";
import UserEntity from "../../../src/core/domain/users/user_entity";

import {
  mockPasswordHashService,
  mockRefreshTokenRepository,
  mockTokenService,
  mockUserRepository,
} from "../helpers/mocks.test_helper";
import AuthRepository from "../../../src/auth/domain/core/auth_repository";
import TelleoAuthRepository from "../../../src/auth/data/core/telleo_auth_repository";
import AuthResult from "../../../src/auth/domain/core/auth_result";
import TokensEntity from "../../../src/core/domain/tokens/tokens_entity";
import AuthFailure from "../../../src/auth/domain/core/auth_failure";
import UserFailure from "../../../src/core/domain/users/user_failure";

describe("AuthRepository", () => {
  let sut: AuthRepository;
  //const testDb: Database = new MemoryDB();

  beforeEach(async () => {
    sut = new TelleoAuthRepository(
      instance(mockUserRepository),
      instance(mockPasswordHashService),
      instance(mockTokenService),
      instance(mockRefreshTokenRepository)
    );
  });

  afterEach(async () => {
    reset(mockUserRepository);
    reset(mockPasswordHashService);
    reset(mockTokenService);
    reset(mockRefreshTokenRepository);
  });

  describe("SignIn", () => {
    it("should return an auth result when user exists in the database and its password matches", async () => {
      // arrange
      const email = "wihwemrab@velap.lk";
      const password = "FfGIJsxJCTUBWJKRqKwQ";
      const user = new UserEntity("id", email, password, "name", "");
      const token = "EdciEHKWXFyvujTTIxBH";
      const authResult = new AuthResult(user, new TokensEntity(token, token));

      when(mockUserRepository.getUser(anything())).thenResolve(
        right(some(user))
      );
      when(
        mockPasswordHashService.compare(anyString(), anyString())
      ).thenResolve(true);
      when(
        mockTokenService.generateToken(anything(), anyString(), anything())
      ).thenResolve(token);
      when(mockTokenService.generateToken(anything(), anyString())).thenResolve(
        token
      );

      when(mockRefreshTokenRepository.save(anyString())).thenResolve(
        some(token)
      );
      // act
      const result = await sut.signInWithEmailAndPassword(email, password);

      // assert

      verify(mockUserRepository.getUser(anything())).once();
      verify(mockPasswordHashService.compare(user.password, password)).once();
      verify(
        mockTokenService.generateToken(
          anything(),
          process.env.ACCESS_TOKEN_SECRET!,
          Number.parseInt(process.env.ACCESS_TOKEN_EXPIRES_IN!)
        )
      ).once();
      verify(
        mockTokenService.generateToken(
          anything(),
          process.env.REFRESH_TOKEN_SECRET!
        )
      ).once();

      verify(mockRefreshTokenRepository.save(token)).once();
      expect(result.isRight()).to.equal(true);
      expect(_.isEqualWith(result, right(authResult)));
    });

    it("should return an auth failure when user does not exist in the database (Error code: emailNotFound)", async () => {
      // arrange
      const email = "wihwemrab@velap.lk";
      const password = "FfGIJsxJCTUBWJKRqKwQ";
      const token = "EdciEHKWXFyvujTTIxBH";
      const authFailure: AuthFailure = AuthFailure.emailNotFound();

      when(mockUserRepository.getUser(anything())).thenResolve(right(none()));
      // act
      const result = await sut.signInWithEmailAndPassword(email, password);

      // assert
      expect(result.isLeft()).to.equal(true);
      verify(mockUserRepository.getUser(anything())).once();
      verify(mockPasswordHashService.compare(anyString(), anyString())).never();

      verify(
        mockTokenService.generateToken(
          anything(),
          process.env.ACCESS_TOKEN_SECRET!,
          Number.parseInt(process.env.ACCESS_TOKEN_EXPIRES_IN!)
        )
      ).never();
      verify(
        mockTokenService.generateToken(
          anything(),
          process.env.REFRESH_TOKEN_SECRET!
        )
      ).never();
      verify(mockRefreshTokenRepository.save(token)).never();
      expect(_.isEqualWith(result, left(authFailure)));
    });

    it("should return an auth failure when password does not match (Error code: wrongPassword)", async () => {
      // arrange
      const email = "wihwemrab@velap.lk";
      const password = "FfGIJsxJCTUBWJKRqKwQ";
      const user = new UserEntity("id", email, password, "name", "");
      const token = "EdciEHKWXFyvujTTIxBH";
      const authFailure: AuthFailure = AuthFailure.wrongPassword();

      when(mockUserRepository.getUser(anything())).thenResolve(
        right(some(user))
      );
      when(
        mockPasswordHashService.compare(anyString(), anyString())
      ).thenResolve(false);
      // act
      const result = await sut.signInWithEmailAndPassword(email, password);

      // assert
      expect(result.isLeft()).to.equal(true);
      verify(mockUserRepository.getUser(anything())).once();
      verify(mockPasswordHashService.compare(password, password)).once();

      verify(
        mockTokenService.generateToken(
          anything(),
          process.env.ACCESS_TOKEN_SECRET!,
          Number.parseInt(process.env.ACCESS_TOKEN_EXPIRES_IN!)
        )
      ).never();
      verify(
        mockTokenService.generateToken(
          anything(),
          process.env.REFRESH_TOKEN_SECRET!
        )
      ).never();
      verify(mockRefreshTokenRepository.save(token)).never();
      expect(_.isEqualWith(result, left(authFailure)));
    });
  });

  describe("SignUp", () => {
    it("should add user to database", async () => {
      const email = "wihwemrab@velap.lk";
      const password = "FfGIJsxJCTUBWJKRqKwQ";
      const token = "EdciEHKWXFyvujTTIxBH";
      const user = new UserEntity("id", email, password, "name", "");
      const authResult = new AuthResult(user, new TokensEntity(token, token));

      when(mockUserRepository.createUser(anyString(), anyString())).thenResolve(
        right(user)
      );
      when(
        mockTokenService.generateToken(anything(), anyString(), anything())
      ).thenResolve(token);
      when(mockTokenService.generateToken(anything(), anyString())).thenResolve(
        token
      );
      when(mockPasswordHashService.hash(anyString())).thenResolve(password);
      when(mockRefreshTokenRepository.save(anyString())).thenResolve(
        some(token)
      );

      const result = await sut.signUpWithEmailAndPassword(email, password);
      expect(result.isRight()).to.equal(true);

      verify(mockUserRepository.getUser(anything())).never();
      verify(mockUserRepository.createUser(email, password)).once();
      verify(mockPasswordHashService.hash(password)).once();
      verify(
        mockTokenService.generateToken(
          anything(),
          process.env.ACCESS_TOKEN_SECRET!,
          Number.parseInt(process.env.ACCESS_TOKEN_EXPIRES_IN!)
        )
      ).once();
      verify(
        mockTokenService.generateToken(
          anything(),
          process.env.REFRESH_TOKEN_SECRET!
        )
      ).once();
      verify(mockRefreshTokenRepository.save(token)).once();
      expect(_.isEqualWith(result, right(authResult))).to.equal(true);
    });
    it("should return an AuthFailure with code emailAlreadyInUse when user does exist in the database", async () => {
      const email = "wihwemrab@velap.lk";
      const password = "FfGIJsxJCTUBWJKRqKwQ";
      const token = "EdciEHKWXFyvujTTIxBH";
      const user = new UserEntity("id", email, password, "name", "");
      const authFailure: AuthFailure = AuthFailure.emailAlreadyInUse();

      when(mockUserRepository.createUser(anyString(), anyString())).thenResolve(
        left(UserFailure.userAlreadyExists())
      );
      when(
        mockTokenService.generateToken(anything(), anyString(), anything())
      ).thenResolve(token);
      when(mockTokenService.generateToken(anything(), anyString())).thenResolve(
        token
      );
      when(mockPasswordHashService.hash(anyString())).thenResolve(password);
      when(mockRefreshTokenRepository.save(anyString())).thenResolve(
        some(token)
      );

      const result = await sut.signUpWithEmailAndPassword(email, password);
      expect(result.isLeft()).to.equal(true);

      verify(mockUserRepository.createUser(anyString(), anyString())).once();
      verify(mockPasswordHashService.hash(anyString())).once();
      verify(
        mockTokenService.generateToken(anything(), anyString(), anyNumber())
      ).never();
      verify(mockTokenService.generateToken(anything(), anyString())).never();
      verify(mockRefreshTokenRepository.save(token)).never();

      expect(
        _.isEqualWith(result, left<AuthFailure, AuthResult>(authFailure))
      ).to.equal(true);
    });
  });
});
