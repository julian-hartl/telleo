import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../value_failures.dart';

abstract class ValueObject<T> extends Equatable {
  const ValueObject();
  Either<AuthValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  T getOrCrash() => value.fold((l) => throw Error(), (r) => r);

  @override
  List<Object?> get props => [value];
}
