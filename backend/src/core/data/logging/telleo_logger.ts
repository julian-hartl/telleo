import winston from "winston";
import Logger from "../../domain/logging/logger";

export default class TelleoLogger implements Logger {
  private log = winston.createLogger({
    format: winston.format.json(),
    transports: [
      new winston.transports.Console({
        format: winston.format.simple(),
      }),
    ],
  });

  warning(warning: any): void {
    this.log.warn(warning);
  }

  info(info: any): void {
    this.log.info(info);
  }

  error(error: any): void {
    this.log.error(error);
  }
}
