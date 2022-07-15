import TokensEntity from "../../../core/domain/tokens/tokens_entity";
import UserEntity from "../../../core/domain/users/user_entity";

export default class AuthResult {
  constructor(
    public readonly user: UserEntity,
    public readonly tokens: TokensEntity
  ) {}
}
