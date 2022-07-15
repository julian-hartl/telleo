import express from "express";
import authRepository from "../../data/core/auth_repository";
import errorHandler from "../middleware/error_handler";

import AuthController from "../controllers/auth_controller";

const router = express.Router();

const authController = new AuthController(authRepository);

router.get("/", (req, res, next) => {
  res.send("Welcome to version 1 of the auth module of Telleo.");
});

router.post("/signup", (req, res, next) => {
  authController.use(req, res, next).signup();
});

router.post("/signin", (req, res, next) => {
  authController.use(req, res, next).signin();
});

router.post("/token", (req, res, next) => {
  authController.use(req, res, next).refreshAccessToken();
});

router.post("/googlesignin", (req, res, next) => {
  authController.use(req, res, next).googleSignin();
});

router.use(errorHandler);

export default router;
