import chai, { expect } from "chai";
import chaiHttp from "chai-http";
import { setUpServer } from "../../src/server";
import MemoryDB from "../helpers/memory_db.test_helper";
import express from "express";
import http from "http";
import expressApp from "../../src/app";

chai.use(chaiHttp);

describe("Server Integration", () => {
  let app: express.Express;
  let cleanUp: () => Promise<void>;

  beforeEach(async () => {
    app = expressApp;

    const server = http.createServer(app);
    const createdServer = await setUpServer(new MemoryDB(), server, {
      test: true,
    });
    cleanUp = createdServer.cleanUp;
  });
  afterEach(async () => {
    await cleanUp();
  });
  it("should respond with Welcome to the API of Telleo when / is requested", (done) => {
    chai
      .request(app)
      .get("/")
      .end((err, res) => {
        expect(res.status).to.equal(200);
        expect(res.text).to.equal(
          "Welcome to the backend of the Telleo application."
        );
        done();
      });
  });

  it("should respond with status of 404 when a random url is requested", (done) => {
    chai
      .request(app)
      .get("/wefwfwfwfw")
      .end((err, res) => {
        expect(res.status).to.equal(404);

        done();
      });
  });
});
