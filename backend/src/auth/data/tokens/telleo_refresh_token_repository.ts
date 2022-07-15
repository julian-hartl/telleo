import { none, Option, some } from "funpjs";
import RefreshTokenRepository from "../../domain/tokens/refresh_token_repository";
import RefreshTokenModel from "./mongoose_refresh_token_model";

export default class TelleoRefreshTokenRepository
  implements RefreshTokenRepository
{
  async exists(token: string): Promise<boolean> {
    const result = await RefreshTokenModel.findOne({ token: token });
    const exists = result != null;
    return exists;
  }
  async save(token: string): Promise<Option<string>> {
    // eslint-disable-next-line security/detect-non-literal-fs-filename
    const exists = await this.exists(token);
    if (!exists) {
      const model = new RefreshTokenModel({ token: token });
      const result = await model.save();
      return some(result.token);
    }
    return none();
  }
}
