import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../domain/user/user_state.dart';
import '../../config.dart';
import '../../domain/core/services/logger.dart';
import '../../domain/core/services/socket_service/socket_service.dart';
import '../../utils/dependencies.dart';

@LazySingleton(as: SocketService)
class TelleoSocketService implements SocketService {
  late Socket socket;

  TelleoSocketService();

  @override
  void emit(String event, {Map<String, dynamic>? data}) {
    if (!isConnected) {
      app.get<ILogger>().logError('Socket is not connected yet.');
      throw Error();
    }

    socket.emit(event, data);
  }

  @override
  void on(String event, void Function(Map<String, dynamic> data) handler) {
    if (!isConnected) {
      app.get<ILogger>().logError('Socket is not connected yet.');
      throw Error();
    }

    socket.on(event, (data) {
      handler(data);
    });
  }

  bool isConnected = false;

  @override
  void connect() {
    socket = io(
      Config.backendUrl,
      OptionBuilder()
          .setTransports(
            ['websocket'],
          )
          .disableAutoConnect()
          .setQuery(
            {
              'uid': app.get<UserState>().getOrCrash().uid,
            },
          )
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
