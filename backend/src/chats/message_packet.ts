import TelleoMessageModel from "../api/chats/data/telleo_message_model";

export default class MessagePacket {
  constructor(
    public readonly message: TelleoMessageModel,
    public readonly to: string,
    public readonly chatId: string
  ) {}

  static fromJson(json: any): MessagePacket {
    return new MessagePacket(
      TelleoMessageModel.fromJson(json.message),
      json.to,
      json.chatId
    );
  }
}
