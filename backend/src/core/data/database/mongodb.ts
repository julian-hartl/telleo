import mongoose from "mongoose";
import {Either, left, right, unit, Unit} from "funpjs";

import Database from "../../domain/database/database";
import {DatabaseConnectionFailure} from "../../domain/database/database_failures";

import log from "../logging/log";

export default class MongoDB implements Database {
  static url = process.env.DB_CONNECTION!;

  async connect(): Promise<Either<DatabaseConnectionFailure, Unit>> {
    try {
      log.info("Connecting to " + MongoDB.url);
      await mongoose.connect(MongoDB.url);
      return right(unit);
    } catch (e) {
      log.error(e);
      return left(new DatabaseConnectionFailure("Could not connect to mongo."));
    }
  }

  async disconnect(): Promise<Either<DatabaseConnectionFailure, Unit>> {
    try {
      await mongoose.disconnect();
      return right(unit);
    } catch (e) {
      log.error(e);
      return left(
        new DatabaseConnectionFailure("Could not disconnect from mongo.")
      );
    }
  }
}
