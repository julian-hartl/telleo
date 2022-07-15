import TelleoUserModel from "../../../core/data/users/telleo_user_model";
import ChatEntity from "../domain/chat_entity";
import TelleoMessageModel from "./telleo_message_model";

export default class TelleoChatModel {
  constructor(
    public readonly users: TelleoUserModel[],
    public readonly id: string,
    public readonly messages: TelleoMessageModel[]
  ) {}
  toEntity(): ChatEntity {
    return new ChatEntity(
      TelleoUserModel.toEntityList(this.users),
      this.id,
      TelleoMessageModel.toEntityList(this.messages)
    );
  }
  static fromJson(json: any): TelleoChatModel {
    return new TelleoChatModel(
      json.users.map((user: any) => TelleoUserModel.fromJson(user)),
      json.id,
      json.messages.map((message: any) => TelleoMessageModel.fromJson(message))
    );
  }
  static fromEntityList(chats: ChatEntity[]): TelleoChatModel[] {
    return chats.map((chat) => TelleoChatModel.fromEntity(chat));
  }

  static toEntityList(chats: TelleoChatModel[]): ChatEntity[] {
    return chats.map((chat) => chat.toEntity());
  }
  static fromEntity(chat: ChatEntity): TelleoChatModel {
    return new TelleoChatModel(
      TelleoUserModel.fromEntityList(chat.users),
      chat.id,
      TelleoMessageModel.fromEntityList(chat.messages)
    );
  }
}
