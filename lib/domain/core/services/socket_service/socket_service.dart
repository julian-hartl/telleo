abstract class SocketService {
  Future<UnregisterEventListener> registerEventListener(
      String event, void Function(Map<String, dynamic> data) handler);
  void emit(String event, {Map<String, dynamic>? data});
  Future<void> connect();
}

typedef EventHandler = void Function(Map<String, dynamic> data);

typedef UnregisterEventListener = void Function();
