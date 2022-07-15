import { expect } from "chai";
import app from "../../../src/app";
import chaiHttp from "chai-http";
import chai from "chai";
chai.use(chaiHttp);

describe("Api Integration", () => {
  it("should respond with Route not found. and a 404 error when some random route is requested is requested", (done) => {
    chai
      .request(app)
      .get("/api/tPdxVUHqMOOXBhEWNiiG")
      .end((err: any, res: any) => {
        console.log(err);
        expect(res.status).to.equal(404);
        expect(res.body.message).to.equal("Route not found.");
        done();
      });
  });
});
