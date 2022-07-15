import { Either, Unit } from "funpjs";
import { DatabaseConnectionFailure } from "./database_failures";

export default interface Database {
  connect(): Promise<Either<DatabaseConnectionFailure, Unit>>;
  disconnect(): Promise<Either<DatabaseConnectionFailure, Unit>>;
}
