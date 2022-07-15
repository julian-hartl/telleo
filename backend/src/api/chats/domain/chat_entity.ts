import UserEntity from "../../../core/domain/users/user_entity";
import MessageEntity from "./message_entity";

export default class ChatEntity {
  constructor(
    public readonly users: UserEntity[],
    public readonly id: string,
    public readonly messages: MessageEntity[]
  ) {}
}
