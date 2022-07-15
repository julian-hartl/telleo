import 'package:dartz/dartz.dart';

import '../../utils/dependencies.dart';
import 'services/logger.dart';

extension DartzOptionExt<T> on Option<T> {
  T getOrCrash() => fold(
        () {
          app
              .get<ILogger>()
              .logError("Tried to get from option when it was none.");
          throw Error();
        },
        (a) => a,
      );
}
