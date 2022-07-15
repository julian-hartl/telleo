import dotenv from "dotenv";
import path from "path";
import log from "./core/data/logging/log";

import Enviroments from "./enviroments";
export default function setUpConfig() {
  const NODE_ENV = process.env.NODE_ENV;
  log.info("Configuring enviroment for " + NODE_ENV);
  if (NODE_ENV === Enviroments.dev) {
    dotenv.config({
      path: path.join(__dirname, "./../.env.test"),
    });
  } else if (NODE_ENV === Enviroments.prod) {
    const envPath = path.join(__dirname, "./../.env.test.production");
    dotenv.config({
      path: envPath,
    });
  } else if (NODE_ENV === Enviroments.test) {
    const envPath = path.join(__dirname, "./../.env.test.test");
    dotenv.config({
      path: envPath,
    });
  }
  const env = {
    PORT: process.env.PORT,
    REFRESH_TOKEN_SECRET: process.env.REFRESH_TOKEN_SECRET,
    ACCESS_TOKEN_SECRET: process.env.ACCESS_TOKEN_SECRET,
    DB_CONNECTION: process.env.DB_CONNECTION,
    ACCESS_TOKEN_EXPIRES_IN: process.env.ACCESS_TOKEN_EXPIRES_IN,
  };

  log.info("Config: " + JSON.stringify(env));
}
