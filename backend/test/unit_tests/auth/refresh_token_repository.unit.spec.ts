import { expect } from "chai";
import RefreshTokenRepository from "../../../src/auth/domain/tokens/refresh_token_repository";
import TelleoRefreshTokenRepository from "../../../src/auth/data/tokens/telleo_refresh_token_repository";
import Database from "../../../src/core/domain/database/database";
import MemoryDB from "../../helpers/memory_db.test_helper";

describe("RefreshTokenRepository", () => {
  let sut: RefreshTokenRepository;
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
    sut = new TelleoRefreshTokenRepository();
  });
  afterEach(async () => {
    const dcResult = await testDb.disconnect();
    dcResult.fold(
      (l) => {
        throw Error(l.reason);
      },
      (r) => {}
    );
  });
  it("should return true when exists is called on a token that has been created before", async () => {
    const token = "esgbXSOiKgefKStkVeTY";

    await sut.save(token);
    const result = await sut.exists(token);

    expect(result).to.equal(true);
  });

  it("should return the refreshToken when its has been saved successfully", async () => {
    const token = "esgbXSOiKgefKStkVeTY";

    const result = await sut.save(token);

    expect(result.isSome()).to.equal(true);
    result.fold(
      () => {},
      (r) => {
        expect(r).to.equal(token);
      }
    );
  });
});
