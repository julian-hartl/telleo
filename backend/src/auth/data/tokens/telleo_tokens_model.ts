import TokensEntity from "../../../core/domain/tokens/tokens_entity";

export default class TelleoTokensModel {
  constructor(public accessToken: string, public refreshToken: string) {}

  static fromDomain(entity: TokensEntity): TelleoTokensModel {
    return new TelleoTokensModel(entity.accessToken, entity.refreshToken);
  }
}
