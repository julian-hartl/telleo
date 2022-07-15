import { Either } from "funpjs";

import ChatEntity from "./chat_entity";
import ChatFailure from "./chat_failure";
import MessageEntity from "./message_entity";

export default interface ChatsRepository {
  getChats(uid: string): Promise<ChatEntity[]>;
  getChat(id: string): Promise<Either<ChatFailure, ChatEntity>>;
  exists(users: string[]): Promise<boolean>;
  createChat(users: string[]): Promise<Either<ChatFailure, ChatEntity>>;
  updateChat(chat: ChatEntity): Promise<Either<ChatFailure, ChatEntity>>;
  addMessage(
    chatId: string,
    message: MessageEntity
  ): Promise<Either<ChatFailure, ChatEntity>>;
}
