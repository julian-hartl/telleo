/* eslint-disable security/detect-non-literal-fs-filename */
import { Types } from "mongoose";
import { Either, right, left } from "funpjs";
import log from "../../../core/data/logging/log";
import UserEntity from "../../../core/domain/users/user_entity";
import UserFailure from "../../../core/domain/users/user_failure";
import UserRepository from "../../../core/domain/users/user_repository";
import ChatsRepository from "../domain/chats_repository";
import ChatEntity from "../domain/chat_entity";
import ChatFailure from "../domain/chat_failure";
import MessageEntity from "../domain/message_entity";

import ChatModel from "./mongoose_chat_model";

export default class TelleoChatsRepository implements ChatsRepository {
  constructor(private readonly userRepository: UserRepository) {}
  async addMessage(
    chatId: string,
    message: MessageEntity
  ): Promise<Either<ChatFailure, ChatEntity>> {
    try {
      const updatedChat = await ChatModel.findByIdAndUpdate(chatId, {
        $push: { messages: message },
      }).populate("users");
      return right(updatedChat as unknown as ChatEntity);
    } catch (e) {
      log.error(e);
      return left(ChatFailure.chatNotFound());
    }
  }
  async updateChat(chat: ChatEntity): Promise<Either<ChatFailure, ChatEntity>> {
    try {
      const updatedChat = await ChatModel.findByIdAndUpdate(chat.id, {
        messages: chat.messages,
        users: chat.users.map((user) => new Types.ObjectId(user.id)),
      }).populate("users");
      return right(updatedChat as unknown as ChatEntity);
    } catch (e) {
      log.error(e);
      return left(ChatFailure.chatNotFound());
    }
  }

  async exists(users: string[]): Promise<boolean> {
    const chats = await ChatModel.find({
      users: { $all: users },
    });
    return chats.length > 0;
  }

  async getChats(uid: string): Promise<ChatEntity[]> {
    const chats = await ChatModel.find({
      users: new Types.ObjectId(uid),
    }).populate<{ users: UserEntity[] }>("users");

    return chats as unknown as ChatEntity[];
  }
  async getChat(id: string): Promise<Either<ChatFailure, ChatEntity>> {
    const chat = await ChatModel.findById(id);
    if (chat != null) {
      return right(chat as unknown as ChatEntity);
    }
    return left(ChatFailure.chatNotFound());
  }

  allTrue(arr: boolean[]): boolean {
    for (const b in arr) {
      if (!b) return false;
    }
    return true;
  }
  async createChat(users: string[]): Promise<Either<ChatFailure, ChatEntity>> {
    if (users.length != 2) {
      return left(ChatFailure.invalidNumberOfUsers());
    }
    if (users[0] === users[1]) {
      return left(ChatFailure.createChatWithSameUser());
    }
    const result = users.map(
      async (uid) => await this.userRepository.exists({ uid })
    );
    const allTrue = await Promise.all(result);
    if (!this.allTrue(allTrue)) {
      return left(UserFailure.userNotFound());
    }

    if (await this.exists(users)) {
      return left(ChatFailure.chatAlreadyExists());
    }
    const chatModel = new ChatModel({
      messages: [],
      users: users.map((user) => new Types.ObjectId(user)),
    });
    const chat = await (
      await chatModel.save()
    ).populate<{ users: UserEntity[] }>("users");
    return right(chat as unknown as ChatEntity);
  }
}
