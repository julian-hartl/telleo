import http from "http";
import chai, { expect } from "chai";
import chaiHttp from "chai-http";
import { setUpServer } from "../../../src/server";
import MemoryDB from "../../helpers/memory_db.test_helper";
import express from "express";
import expressApp from "../../../src/app";

chai.use(chaiHttp);

describe("V1 Integration", () => {
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
  it("should respond with Welcome to the backend of the Telleo application. when / is requested", (done) => {
    chai
      .request(app)
      .get("/")
      .end((err, res) => {
        console.log(err);
        expect(res.status).to.equal(200);
        expect(res.text).to.equal(
          "Welcome to the backend of the Telleo application."
        );
        done();
      });
  });

  it("should respond with Route not found. and a 404 error when some random route is requested is requested", (done) => {
    chai
      .request(app)
      .get("/auth/tPdxVUHqMOOXBhEWNiiG")
      .end((err, res) => {
        console.log(err);
        expect(res.status).to.equal(404);
        expect(res.body.message).to.equal("Route not found.");
        done();
      });
  });
});
