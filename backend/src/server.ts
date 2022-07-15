import http from "http";
import log from "./core/data/logging/log";
import Database from "./core/domain/database/database";

type ServerSetupOptions = {
  cleanup?: () => Promise<void>;
  test?: boolean;
};

type ServerConfiguration = {
  cleanUp: () => Promise<void>;
};

export async function setUpServer(
  database: Database,
  server: http.Server,
  options?: ServerSetupOptions
): Promise<ServerConfiguration> {
  log.info("Waiting for database to connect...");
  const result = await database.connect();
  result.fold(
    (l) => {
      log.error("Could not connect to database. [Check if you started mongod]");
      process.exit(-1);
    },
    (r) => {
      log.info("Database connected successfully.");
    }
  );

  const isTest = options?.test;
  if (!isTest) {
    const PORT = process.env.PORT || 5000;
    server.listen(PORT, () => {
      log.info("Server started on port " + PORT + ".");
    });
  }

  const cleanup = async () => {
    await database.disconnect();
    if (options?.cleanup) {
      await options.cleanup();
    }
  };
  handleExit(cleanup);

  return {
    cleanUp: cleanup,
  };
}

function exitHandler(source: string, cleanup: () => Promise<void>) {
  console.log(source + ": Cleaning up");
  cleanup();
  process.exit();
}

function handleExit(cleanup: () => Promise<void>) {
  process.stdin.resume(); //so the program will not close instantly

  //do something when app is closing
  process.on("exit", exitHandler.bind(null, "exit", cleanup));

  //catches ctrl+c event
  process.on("SIGINT", exitHandler.bind(null, "SIGINT", cleanup));

  // catches "kill pid" (for example: nodemon restart)
  process.on("SIGUSR1", exitHandler.bind(null, "SIGUSR1", cleanup));
  process.on("SIGUSR2", exitHandler.bind(null, "SIGUSR2", cleanup));
  process.on("unhandledRejection", (err: any) => {
    log.error(err);
    exitHandler.bind(null, "unhandledRejection", cleanup);
  });
  process.on("uncaughtException", (err: any) => {
    log.error(err);
    exitHandler.bind(null, "uncaughtException", cleanup);
  });
}
