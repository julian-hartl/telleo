import MessageEntity from "../domain/message_entity";

export default class TelleoMessageModel {
  constructor(
    public readonly sender: string,
    public readonly content: string
  ) {}

  static fromEntityList(messages: MessageEntity[]): TelleoMessageModel[] {
    return messages.map((message) => TelleoMessageModel.fromEntity(message));
  }

  static toEntityList(messages: TelleoMessageModel[]): MessageEntity[] {
    return messages.map((message) => message.toEntity());
  }

  static fromJson(json: any): TelleoMessageModel {
    return new TelleoMessageModel(json.sender, json.content);
  }

  static fromEntity(message: MessageEntity): TelleoMessageModel {
    return new TelleoMessageModel(message.sender, message.content);
  }

  toEntity(): MessageEntity {
    return new MessageEntity(this.content, this.sender);
  }
}
