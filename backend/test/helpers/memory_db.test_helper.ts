import { Either, left, right, unit, Unit } from "funpjs";
import { MongoMemoryServer } from "mongodb-memory-server";
import { MongoMemoryServerStates } from "mongodb-memory-server-core/lib/MongoMemoryServer";
import mongoose from "mongoose";

import Database from "../../src/core/domain/database/database";
import { DatabaseConnectionFailure } from "../../src/core/domain/database/database_failures";

export default class MemoryDB implements Database {
  mongoServer: MongoMemoryServer | undefined;

  async connect(): Promise<Either<DatabaseConnectionFailure, Unit>> {
    try {
      if (!this.mongoServer) {
        this.mongoServer = await MongoMemoryServer.create();
      }
      if (this.mongoServer.state === MongoMemoryServerStates.stopped) {
        await this.mongoServer?.start();
      }
      await mongoose.connect(this.mongoServer.getUri(), { dbName: "TestDB" });
      return right(unit);
    } catch (e) {
      console.error(e);
      return left(
        new DatabaseConnectionFailure("Connection failed [" + e + "]")
      );
    }
  }
  async disconnect(): Promise<Either<DatabaseConnectionFailure, Unit>> {
    try {
      if (mongoose.connections.length != 0) {
        await this.mongoServer?.stop();
        await mongoose.disconnect();
      }

      return right(unit);
    } catch (e) {
      console.error(e);
      return left(new DatabaseConnectionFailure("Disconnection failed."));
    }
  }
}
