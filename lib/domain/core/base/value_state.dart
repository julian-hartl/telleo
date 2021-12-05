import 'package:dartz/dartz.dart';
import '../async_value.dart';

abstract class ValueState<T> {
  ValueState();
  T get value;
  void update(T value);
}
