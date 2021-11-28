import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../domain/core/logger.dart';

@LazySingleton(as: ILogger)
class TelleoLogger implements ILogger {
  final Logger logger;
  TelleoLogger({
    required this.logger,
  });

  @override
  void logError(error) {
    logger.e(error.toString());
  }

  @override
  void logInfo(String info) {
    logger.i(info);
  }
}
