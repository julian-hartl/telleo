abstract class StateChangeNotifier<T> {
  void notifyListeners() {
    for (var listener in _listeners) {
      listener.call(state);
    }
  }

  T get state;

  final List<Listener<T>> _listeners = [];

  RemoveListener addListener(Listener<T> listener) {
    _listeners.add(listener);
    return () {
      _listeners.remove(listener);
    };
  }
}

typedef Listener<T> = void Function(T t);

typedef RemoveListener = void Function();
