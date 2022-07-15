import mongoose from "mongoose";
import MessageEntity from "../domain/message_entity";

import MessageSchema from "./mongoose_message_schema";

export interface ChatDocument extends mongoose.Document {
  users: mongoose.Types.ObjectId[];
  messages: MessageEntity[];
}

const chatSchema = new mongoose.Schema<ChatDocument>({
  users: [
    {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "User",
    },
  ],
  messages: [
    {
      type: MessageSchema,
      default: [],
    },
  ],
});

/*
chatSchema.pre<mongoose.Query<ChatDocument, ChatDocument>>(
  "find",
  async function () {
    await this.populate<{ users: UserEntity[] }>("users");
  }
);
*/

const ChatModel = mongoose.model<ChatDocument>("Chat", chatSchema);

export default ChatModel;

/*
chatSchema.post<mongoose.Query<ChatEntity, ChatEntity>>('findOne',async (doc) =>{
    this.
} )
*/
