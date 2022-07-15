import express from "express";
import authenticate from "../../../core/application/middleware/authenticate";
import userRepository from "../../../core/data/users/user_repository";

import UserController from "./user_controller";

const userRouter = express.Router();
const userController = new UserController(userRepository);
userRouter.get("/email/:email", authenticate(), (req, res, next) => {
  userController.use(req, res, next).getUserByEmail();
});
userRouter.get("/token/:token", authenticate(), (req, res, next) => {
  userController.use(req, res, next).getUserByToken();
});
userRouter.get("/", authenticate(), (req, res, next) => {
  userController.use(req, res, next).getAllUsers();
});
userRouter.get("/search/:query", authenticate(), (req, res, next) => {
  userController.use(req, res, next).searchUsers();
});
userRouter.put("/update", authenticate(), (req, res, next) => {
  userController.use(req, res, next).updateUser();
});

export default userRouter;
