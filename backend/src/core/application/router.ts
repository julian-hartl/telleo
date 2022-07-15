import express from "express";
import apiRouter from "../../api/application/routing/router";
import authRouter from "../../auth/application/routing/auth_router";

import ErrorCodes from "../domain/errors/error_codes";

const router = express.Router();
/*
v1Router.use(
  pino({
    quietReqLogger: true,
    transport: {
      target: "pino-pretty",
      options: {
        translateTime: true,
        colorize: true,
      },
    },
  })
);
*/

router.get("/", (req, res, next) => {
  res.send("Welcome to version 1 of the Telleo backend.");
});

router.use("/auth", authRouter);
router.use("/api", apiRouter);

router.use((req, res, next) => {
  res.status(404);
  res.json({
    error: true,
    code: ErrorCodes.routeNotFound,
    message: "Route not found.",
  });
});

export default function applicationRouter(): express.Router {
  return router;
}
