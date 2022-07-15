import express from "express";
import authenticate from "../../../core/application/middleware/authenticate";
import chatsRepository from "../../chats/data/chat_repository";

import ChatController from "./chats_controller";

const chatRouter = express.Router();

const chatController = new ChatController(chatsRepository);

chatRouter.get("/:uid", authenticate(), (req, res, next) => {
  chatController.use(req, res, next).getChats();
});

chatRouter.post("/create", authenticate(), (req, res, next) => {
  chatController.use(req, res, next).createChat();
});

chatRouter.put("/update", authenticate(), (req, res, next) => {
  chatController.use(req, res, next).updateChat();
});

export default chatRouter;
