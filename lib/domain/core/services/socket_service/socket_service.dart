abstract class SocketService {
  void on(String event, void Function(Map<String, dynamic> data) handler);
  void emit(String event, {Map<String, dynamic>? data});
  void connect();
}
