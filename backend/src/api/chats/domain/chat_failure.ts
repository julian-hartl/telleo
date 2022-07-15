import CustomFailure from "../../../core/domain/errors/custom_failure";
import ErrorCodes from "../../../core/domain/errors/error_codes";

export default class ChatFailure extends CustomFailure {
  private constructor(reason: string, errorCode: number, status: number) {
    super(reason, errorCode, status);
  }

  static chatNotFound(): ChatFailure {
    return new ChatFailure(
      "Chat not found.",
      ErrorCodes.Chats.chatNotFound,
      409
    );
  }

  static createChatWithSameUser(): ChatFailure {
    return new ChatFailure(
      "Cannot create chat with same user.",
      ErrorCodes.Chats.chatWithSameUser,
      400
    );
  }

  static invalidNumberOfUsers(): ChatFailure {
    return new ChatFailure(
      "A chat can only consist of two users.",
      ErrorCodes.Chats.invalidNumberOfUsers,
      400
    );
  }

  static chatAlreadyExists(): ChatFailure {
    return new ChatFailure(
      "Chat already exists.",
      ErrorCodes.Chats.chatAlreadyExists,
      409
    );
  }
}
