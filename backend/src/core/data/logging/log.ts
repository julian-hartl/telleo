import Logger from "../../domain/logging/logger";
import TelleoLogger from "./telleo_logger";

const log: Logger = new TelleoLogger();
export default log;
