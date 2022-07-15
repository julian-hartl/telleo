import userRepository from "../../../core/data/users/user_repository";
import ChatsRepository from "../domain/chats_repository";

import TelleoChatsRepository from "./telleo_chat_repository";

const chatsRepository: ChatsRepository = new TelleoChatsRepository(
  userRepository
);
export default chatsRepository;
