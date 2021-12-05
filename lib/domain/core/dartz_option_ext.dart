import 'package:dartz/dartz.dart';

extension DartzOptionExt<T> on Option<T> {
  T getOrCrash() => fold(
        () => throw Error(),
        (a) => a,
      );
}
