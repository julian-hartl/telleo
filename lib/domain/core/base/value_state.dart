import 'package:dartz/dartz.dart';

abstract class ValueState<T> {
  ValueState();
  Option<T> get value;
  void update(Option<T> value);
  T getOrCrash() => value.fold(() => throw Error(), (a) => a);
}
