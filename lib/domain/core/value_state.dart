abstract class ValueState<T> {
  T get value;
  void update(T t);
}
