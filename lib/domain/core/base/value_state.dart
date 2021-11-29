import '../../change_notifier.dart';

abstract class ValueState<T> extends StateChangeNotifier<T> {
  T get value;
  void update(T value);
  Future<void> load();
}
