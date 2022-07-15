import http from "http";
import chai, { expect } from "chai";
import chaiHttp from "chai-http";
import { setUpServer } from "../../../src/server";
import MemoryDB from "../../helpers/memory_db.test_helper";
import express from "express";

import expressApp from "../../../src/app";
import Database from "../../../src/core/domain/database/database";
import ErrorCodes from "../../../src/core/domain/errors/error_codes";

chai.use(chaiHttp);

describe("AuthModule Integration", () => {
  let app: express.Express;
  let db: Database;
  let cleanUp: () => Promise<void>;

  beforeEach(async () => {
    app = expressApp;
    const server = http.createServer(app);
    db = new MemoryDB();
    const createdServer = await setUpServer(db, server, {
      test: true,
    });
    cleanUp = createdServer.cleanUp;
  });
  afterEach(async () => {
    await db.disconnect();
  });
  it("should return an user with the given email address", (done) => {
    const email = "zaw@him.kw";
    const password = "AKmTVAxZQZaxhhMQmAhM";
    chai
      .request(app)
      .post("/auth/signup")
      .set("Content-Type", "application/json")
      .send({ email, password })
      .end((err, res) => {
        expect(err).to.equal(null);
        expect(res.status).to.equal(200);
        expect(res.body.error).to.equal(false);
        expect(res.body.user.email).to.equal(email);
        done();
      });
  });

  it("should return an error with error code 409", (done) => {
    const email = "zaw@him.kw";
    const password = "AKmTVAxZQZaxhhMQmAhM";
    chai
      .request(app)
      .post("/auth/signin")
      .set("Content-Type", "application/json")
      .send({ email, password })
      .end((err, res) => {
        expect(res.status).to.equal(409);
        expect(res.body.error).to.equal(true);
        expect(res.body.code).to.equal(ErrorCodes.Auth.emailNotFound);
        done();
      });
  });

  it("should be able to sign in with an account that has just been created", async () => {
    const email = "zaw@him.kw";
    const password = "AKmTVAxZQZaxhhMQmAhM";
    const requester = chai.request(app).keepOpen();

    await requester
      .post("/auth/signup")
      .set("Content-Type", "application/json")
      .send({ email, password });
    const res = await requester
      .post("/auth/signin")
      .set("Content-Type", "application/json")
      .send({ email, password });

    expect(res.status).to.equal(200);
    expect(res.body.error).to.equal(false);
    expect(res.body.user.email).to.equal(email);
    requester.close();
  });
});
