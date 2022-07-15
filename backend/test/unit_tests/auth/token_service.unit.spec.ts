import { expect } from "chai";
import _ from "lodash";
import TokenService from "../../../src/core/domain/tokens/token_service";
import JWT from "../../../src/core/data/tokens/jwt";
import { delay } from "../helpers/helper_functions.test_helper";

import TokenFailure from "../../../src/core/domain/tokens/token_failure";

describe("TokenService", () => {
  let sut: TokenService;
  beforeEach(() => {
    sut = new JWT();
  });

  it("should return exactly the payload that was passed to generate the token when it is decoded", async () => {
    const payload = {
      text: "HI",
    };
    const secret =
      "MRmfZwKcSOSinIUZfZTFFZhatRfAtFslJYBHHnQEGsHScrNANFzmkWUvekJbGuWaofkfGaXUJyVXisVEMABKYbqXeaemjfkCzjpA";

    const token = await sut.generateToken(payload, secret);
    const decoded = await sut.decodeToken(token, secret);

    expect(decoded.isRight()).to.equal(true);
    decoded.fold(
      (l) => {},
      (r) => {
        expect(_.isEqualWith(r, payload)).to.equal(true);
      }
    );
  });

  it("should return exactly the payload that was passed to generate the token when it is decoded (even when it expires in some time)", async () => {
    const payload = {
      text: "HI",
    };
    const secret =
      "MRmfZwKcSOSinIUZfZTFFZhatRfAtFslJYBHHnQEGsHScrNANFzmkWUvekJbGuWaofkfGaXUJyVXisVEMABKYbqXeaemjfkCzjpA";

    const token = await sut.generateToken(payload, secret, 60000);
    const decoded = await sut.decodeToken(token, secret);

    expect(decoded.isRight()).to.equal(true);
    decoded.fold(
      (l) => {},
      (r) => {
        expect(_.isEqualWith(r, payload)).to.equal(true);
      }
    );
  });

  it("should return an ExpiredTokenFailure when the token is expired", async () => {
    const payload = {
      text: "HI",
    };
    const secret =
      "MRmfZwKcSOSinIUZfZTFFZhatRfAtFslJYBHHnQEGsHScrNANFzmkWUvekJbGuWaofkfGaXUJyVXisVEMABKYbqXeaemjfkCzjpA";
    const expiresIn = 100;
    const expiredTokenFailure = TokenFailure.expiredToken();

    const token = await sut.generateToken(payload, secret, expiresIn);
    await delay(expiresIn);
    const decoded = await sut.decodeToken(token, secret);

    expect(decoded.isLeft()).to.equal(true);
    decoded.fold(
      (f) => {
        expect(_.isEqualWith(f, expiredTokenFailure)).to.equal(true);
      },
      (r) => {}
    );
  });

  it("should return true when a valid token is verified", async () => {
    const payload = {
      text: "HI",
    };
    const secret =
      "MRmfZwKcSOSinIUZfZTFFZhatRfAtFslJYBHHnQEGsHScrNANFzmkWUvekJbGuWaofkfGaXUJyVXisVEMABKYbqXeaemjfkCzjpA";

    const token = await sut.generateToken(payload, secret);
    const valid = await sut.verify(token, secret);

    expect(valid).to.equal(true);
  });

  it("should return true when a valid token is verified (even when it can expire)", async () => {
    const payload = {
      text: "HI",
    };
    const expiresIn = 1000;

    const secret =
      "MRmfZwKcSOSinIUZfZTFFZhatRfAtFslJYBHHnQEGsHScrNANFzmkWUvekJbGuWaofkfGaXUJyVXisVEMABKYbqXeaemjfkCzjpA";

    const token = await sut.generateToken(payload, secret, expiresIn);
    const valid = await sut.verify(token, secret);

    expect(valid).to.equal(true);
  });

  it("should return false when an expired token is verified", async () => {
    const payload = {
      text: "HI",
    };
    const secret =
      "MRmfZwKcSOSinIUZfZTFFZhatRfAtFslJYBHHnQEGsHScrNANFzmkWUvekJbGuWaofkfGaXUJyVXisVEMABKYbqXeaemjfkCzjpA";
    const expiresIn = 1000;

    const token = await sut.generateToken(payload, secret, expiresIn);
    await delay(expiresIn);
    const valid = await sut.verify(token, secret);

    expect(valid).to.equal(false);
  });

  it("should produce the same token when generated with the same payload and the same secret", async () => {
    const payload = {
      text: "HI",
    };
    const secret =
      "MRmfZwKcSOSinIUZfZTFFZhatRfAtFslJYBHHnQEGsHScrNANFzmkWUvekJbGuWaofkfGaXUJyVXisVEMABKYbqXeaemjfkCzjpA";

    const token1 = await sut.generateToken(payload, secret);
    const token2 = await sut.generateToken(payload, secret);

    expect(_.isEqualWith(token1, token2)).to.equal(true);
  });
});
