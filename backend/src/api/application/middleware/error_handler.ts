import { ErrorRequestHandler } from "express";
import log from "../../../core/data/logging/log";
import TelleoError from "../../../core/domain/errors/custom_error";

const errorHandler: ErrorRequestHandler = (err, req, res, next) => {
  const isTelleoError = err instanceof TelleoError;
  if (!isTelleoError) {
    log.warning(
      "Only custom errors should reach the errorHandling middleware."
    );
    err = TelleoError.internalServerError();
  }
  err = err as TelleoError;
  log.error(err);
  res.status(err.statusCode);
  res.json({
    error: true,
    message: err.message,
    code: err.errorCode,
  });
};

export default errorHandler;
