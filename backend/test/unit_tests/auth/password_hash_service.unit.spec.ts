import { expect } from "chai";
import PasswordHashService from "../../../src/auth/domain/encryption/password_hash_service";
import Bcrypt from "../../../src/auth/data/encryption/bcrypt";

describe("PasswordHashService", () => {
  let sut: PasswordHashService;
  beforeEach(() => {
    sut = new Bcrypt();
  });
  it("should return true when the hashed password and the original password are compared", async () => {
    const password = "RNTjzEDyUTZjvOKMulwx";

    const hashedPassword = await sut.hash(password);
    const result = await sut.compare(hashedPassword, password);

    expect(result).to.equal(true);
  });
});
