import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../services/logger.dart';
import '../../../utils/dependencies.dart';
import 'value_failure.dart';

abstract class ValueObject<T> extends Equatable {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  T getOrElse(T Function(ValueFailure<T> failure) orElse) {
    return value.fold((f) => orElse(f), (r) => r);
  }

  T getOrCrash() => value.fold((l) {
        app
            .get<ILogger>()
            .logError('Tried getting from option eventhough it is none');
        throw Error();
      }, (r) => r);

  @override
  List<Object?> get props => [value];
}
