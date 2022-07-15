import express from "express";
import router from "./routes";

const authRouter = express.Router();

authRouter.use(router);

export default authRouter;
