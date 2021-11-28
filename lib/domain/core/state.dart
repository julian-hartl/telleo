import 'entity.dart';

abstract class State<T extends Entity?> {
  void update(T? t);
}
