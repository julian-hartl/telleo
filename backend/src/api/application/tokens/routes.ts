import express from "express";
import refreshTokenRepository from "../../../auth/data/tokens/refresh_token_repository";
import tokenService from "../../../core/data/tokens/token_service";

import TokensController from "./tokens_controller";

const tokensRouter = express.Router();
const tokensController = new TokensController(
  tokenService,
  refreshTokenRepository
);

tokensRouter.get("/verify", async (req, res, next) => {
  await tokensController.use(req, res, next).verify();
});

export default tokensRouter;
