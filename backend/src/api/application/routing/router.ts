import express from "express";
import passport from "passport";
import authenticate, {
  initAuthentication,
} from "../../../core/application/middleware/authenticate";
import userRepository from "../../../core/data/users/user_repository";

import chatRouter from "../chats/chat_routes";
import errorHandler from "../middleware/error_handler";
import tokensRouter from "../tokens/routes";
import userRouter from "../users/user_routes";

const apiRouter = express.Router();

apiRouter.use(passport.initialize());
passport.use(initAuthentication(userRepository));

apiRouter.get("/", (req, res) => {
  res.json({
    text: "Welcome to the API of the Telleo application.",
  });
});

apiRouter.get("/token", authenticate(), (req, res) => {
  res.send("yaaaay");
});

apiRouter.use("/users", userRouter);
apiRouter.use("/chats", chatRouter);
apiRouter.use("/tokens", tokensRouter);

apiRouter.use(errorHandler);

export default apiRouter;
