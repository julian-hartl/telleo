import { NextFunction, Request, Response } from "express";
import log from "../../../core/data/logging/log";
import TelleoError from "../../../core/domain/errors/custom_error";
import TelleoChatModel from "../../chats/data/telleo_chat_model";
import ChatsRepository from "../../chats/domain/chats_repository";

import ChatEntity from "../../chats/domain/chat_entity";

export default class ChatController {
  public constructor(private readonly chatRepository: ChatsRepository) {}

  use(req: Request, res: Response, next: NextFunction): ChatControllerInternal {
    return new ChatControllerInternal(req, res, next, this.chatRepository);
  }
}

function isStringArray(arr: any): boolean {
  if (Array.isArray(arr)) {
    arr.forEach(function (item) {
      if (typeof item !== "string") {
        return false;
      }
    });
    return true;
  }
  return false;
}

class ChatControllerInternal {
  public constructor(
    private readonly req: Request,
    private readonly res: Response,
    private readonly next: NextFunction,
    private readonly chatRepository: ChatsRepository
  ) {}

  async updateChat(): Promise<void> {
    try {
      const chatModel: TelleoChatModel = this.req.body.chat;
    } catch (e) {
      return this.next(TelleoError.badProperty("chat", "chat"));
    }
    const chat: ChatEntity = TelleoChatModel.fromJson(
      this.req.body.chat
    ).toEntity();
    try {
      const result = await this.chatRepository.updateChat(chat);
      result.fold(
        (failure) => this.next(TelleoError.fromFailure(failure)),
        (chat) =>
          this.res.json({
            error: false,
            chat: TelleoChatModel.fromEntity(chat),
          })
      );
    } catch (e) {
      log.error(e);
      return this.next(TelleoError.internalServerError());
    }
  }

  async createChat(): Promise<void> {
    let { users } = this.req.body;

    if (!users) {
      return this.next(TelleoError.missingProperty("users"));
    }

    if (isStringArray(users)) {
      users = users as string[];
      const chatResult = await this.chatRepository.createChat(users);
      chatResult.fold(
        (failure) => {
          return this.next(TelleoError.fromFailure(failure));
        },
        (chat) => {
          this.res.json({
            error: false,
            chat: TelleoChatModel.fromEntity(chat),
          });
        }
      );
    } else {
      return this.next(TelleoError.badProperty("users", "string[]"));
    }
  }

  async getChats(): Promise<void> {
    const { uid } = this.req.params;

    if (!uid) {
      return this.next(TelleoError.missingProperty("uid"));
    }
    if (typeof uid === "string") {
      const chats = await this.chatRepository.getChats(uid);
      this.res.json({
        error: false,
        chats: TelleoChatModel.fromEntityList(chats),
      });
    } else {
      return this.next(TelleoError.badProperty("uid", "string"));
    }
  }
}
