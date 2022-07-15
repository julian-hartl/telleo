import mongoose from "mongoose";
import MessageEntity from "../domain/message_entity";

const MessageSchema = new mongoose.Schema<MessageEntity>({
  content: {
    type: String,
    required: true,
  },
  sender: {
    type: String,
    required: true,
  },
});

export default MessageSchema;
