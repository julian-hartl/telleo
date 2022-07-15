import Database from "../../domain/database/database";
import MongoDB from "./mongodb";

const database: Database = new MongoDB();
export default database;
