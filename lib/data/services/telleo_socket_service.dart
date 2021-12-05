import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:telleo/config.dart';
import 'package:telleo/domain/core/services/logger.dart';
import 'package:telleo/domain/core/services/socket_service/socket_service.dart';
import 'package:telleo/utils/dependencies.dart';

@LazySingleton(as: SocketService)
class TelleoSocketService implements SocketService {
  late Socket socket;

  TelleoSocketService();

  @override
  void emit(String event, {Map<String, dynamic>? data}) {
    if (!isConnected) throw Error();

    socket.emit(event, data);
  }

  @override
  void on(String event, void Function(Map<String, dynamic> data) handler) {
    if (!isConnected) throw Error();
    socket.on(event, (data) {
      handler(data);
    });
  }

  bool isConnected = false;

  @override
  void connect() {
    socket = io(
      Config.apiUrl,
      OptionBuilder()
          .setTransports(
            ['websocket'],
          )
          .disableAutoConnect()
          .build(),
    );
    app.get<ILogger>().logInfo('Connecting socket...');
    socket.connect();
    socket.onConnect((data) {
      app.get<ILogger>().logInfo('Connected socket!');
      isConnected = true;
    });
    socket.onError((data) {
      app.get<ILogger>().logError(data);
    });
  }
}
