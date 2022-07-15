import http from "http";
import chaiHttp from "chai-http";
import chai, { expect } from "chai";
import { setUpServer } from "../../../src/server";
import express from "express";

import MemoryDB from "../../helpers/memory_db.test_helper";
import expressApp from "../../../src/app";

import _ from "lodash";
import authRepository from "../../../src/auth/data/core/auth_repository";
import UserEntity from "../../../src/core/domain/users/user_entity";
import Database from "../../../src/core/domain/database/database";

chai.use(chaiHttp);

describe("User Integration", () => {
  let app: express.Express;
  let db: Database;

  beforeEach(async () => {
    app = expressApp;
    const server = http.createServer(app);
    db = new MemoryDB();
    await setUpServer(db, server, {
      test: true,
    });
  });
  afterEach(async () => {
    await db.disconnect();
  });
  describe("/users", () => {
    it("should return a 401 status code when no access token is provided", async () => {
      const response = await chai
        .request(app)
        .get("/api/users")
        .set("Content-Type", "application/json")
        .send();
      expect(response.status).to.equal(401);
    });

    it("should return a list containing the user that was created before when a valid access token is provided", async () => {
      const signUpResult = await authRepository.signUpWithEmailAndPassword(
        "julian.hartl04@gmail.com",
        "kwefjelwkjflkwjfwlk"
      );
      expect(signUpResult.isRight()).to.equal(true);
      await signUpResult.fold(
        async (failure) => {},
        async (authResult) => {
          const user = authResult.user;
          const accessToken = authResult.tokens.accessToken;
          const response = await chai
            .request(app)
            .get("/api/users")
            .set("Content-Type", "application/json")
            .set("authorization", "BEARER " + accessToken)
            .send();
          expect(response.status).to.equal(200);
          const users: UserEntity[] = response.body.users;
          expect(users.length).to.equal(1);
          expect(_.isEqualWith(users[0].email, user.email)).to.equal(true);
          //   expect(users.includes(user)).to.equal(true);
        }
      );
    });

    it("should return an error code of 205 when an expired access token is provided, when a new access token that is valid is passed it should return a status of 200", async () => {
      const signUpResult = await authRepository.signUpWithEmailAndPassword(
        "julian.hartl04@gmail.com",
        "kwefjelwkjflkwjfwlk"
      );
      expect(signUpResult.isRight()).to.equal(true);
      await signUpResult.fold(
        async (failure) => {},
        async (authResult) => {
          const user = authResult.user;
          const invalidAccessToken =
            authResult.tokens.accessToken + "ewljfkewjl";
          const refreshToken = authResult.tokens.refreshToken;
          const response = await chai
            .request(app)
            .get("/api/users")
            .set("Content-Type", "application/json")
            .set("authorization", "BEARER " + invalidAccessToken)
            .send();
          expect(response.status).to.equal(401);
          expect(response.body.error).to.equal(true);
          expect(response.body.code).to.equal(205);
          const refreshTokenResponse = await chai
            .request(app)
            .post("/auth/token")
            .set("Content-Type", "application/json")
            .send({
              refreshToken,
            });

          const validAccessToken = refreshTokenResponse.body.accessToken;
          expect(validAccessToken).to.not.be.a("undefined");
          const response1 = await chai
            .request(app)
            .get("/api/users")
            .set("Content-Type", "application/json")
            .set("authorization", "BEARER " + validAccessToken)
            .send();
          expect(response1.status).to.equal(200);
          expect(response1.body.users.length).to.equal(1);

          //   expect(users.includes(user)).to.equal(true);
        }
      );
    });
  });
});
