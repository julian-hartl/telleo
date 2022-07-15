import setUpConfig from "./set_up_config";
setUpConfig();
import http from "http";
import socketio from "socket.io";
import express, { ErrorRequestHandler } from "express";
import morgan from "morgan";
import applicationRouter from "./core/application/router";

import { setUpServer } from "./server";

import Enviroments from "./enviroments";
import registerChatEvents from "./chats/chats_event_handler";

import registerFriendRequestsEvents from "./friends/friend_requests_event_handler";
import friendsRepository from "./friends/telleo_friends_repository";
import chatsRepository from "./api/chats/data/chat_repository";
import log from "./core/data/logging/log";
import ErrorCodes from "./core/domain/errors/error_codes";
import database from "./core/data/database/database";

const app = express();
const server = http.createServer(app);
const io = new socketio.Server(server);

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

registerChatEvents(io, chatsRepository);
registerFriendRequestsEvents(io, friendsRepository);

io.on("connection", (socket: socketio.Socket) => {
  log.info("Client connected.");
  socket.on("disconnect", () => {
    log.info("Client disconnected.");
  });
});

app.use(morgan("tiny"));

app.get("/", (req, res) => {
  res.send("Welcome to the backend of the Telleo application.");
});

app.use(applicationRouter());

const errorHandler: ErrorRequestHandler = (err, req, res, next) => {
  log.error(
    "This should not happen at all. [Errors should be caught be their routers]"
  );

  process.exit(-1);
};

app.use(errorHandler);

app.use((req, res, next) => {
  res.json({
    error: true,
    code: ErrorCodes.routeNotFound,
    message: "Route not found.",
  });
});

log.info("Starting server...");

const NODE_ENV = process.env.NODE_ENV;
if (NODE_ENV != Enviroments.test) {
  setUpServer(database, server);
}

export default app;
