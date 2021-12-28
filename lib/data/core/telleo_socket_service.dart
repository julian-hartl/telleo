import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../application/blocs/app/user/loader/user_bloc.dart';

import '../../config.dart';
import '../../domain/core/services/logger.dart';
import '../../domain/core/services/socket_service/socket_service.dart';
import '../../utils/dependencies.dart';

@LazySingleton(as: SocketService)
class TelleoSocketService implements SocketService {
  late Socket socket;

  final UserBloc userBloc;

  TelleoSocketService(this.userBloc);

  @override
  void emit(String event, {Map<String, dynamic>? data}) {
    if (!isConnected) {
      app.get<ILogger>().logError('Socket is not connected yet.');
      throw Error();
    }

    socket.emit(event, data);
  }

  bool isConnected = false;
  bool isConnecting = false;

  Completer<void> _connectionCompleter = Completer();

  @override
  Future<void> connect() async {
    if (isConnected) return;
    if (isConnecting) {
      return await _connectionCompleter.future;
    }
    isConnecting = true;
    final uid = (await userBloc.getCurrentUser()).uid;
    try {
      socket = io(
        Config.backendUrl,
        OptionBuilder()
            .setTransports(
              ['websocket'],
            )
            .disableAutoConnect()
            .setQuery(
              {
                'uid': uid,
              },
            )
            .build(),
      );
      app.get<ILogger>().logInfo('Connecting socket...');
      socket.connect();
      socket.onConnect((data) {
        app.get<ILogger>().logInfo('Connected socket!');
        isConnected = true;
        if (!_connectionCompleter.isCompleted) {
          _connectionCompleter.complete();
        }
      });
      socket.onDisconnect((_) {
        isConnected = false;
        _connectionCompleter = Completer();
      });
      socket.onError((data) {
        app.get<ILogger>().logError(data);
      });
      return await _connectionCompleter.future;
    } catch (e) {
      isConnecting = false;
      _connectionCompleter.completeError(e);
    }
  }

  final List<EventListener> _listeners = [];

  List<EventListener> _findListeners(String event) {
    final List<EventListener> listeners = [];
    for (var listener in _listeners) {
      if (listener.event == event) {
        listeners.add(listener);
      }
    }
    return listeners;
  }

  final List<String> _registeredEvents = [];

  @override
  Future<UnregisterEventListener> registerEventListener(
      String event, EventHandler handler) async {
    await _connectionCompleter.future;
    final listener = EventListener(event: event, handler: handler);
    _listeners.add(listener);
    if (!_registeredEvents.contains(event)) {
      _registeredEvents.add(event);
      socket.on(event, (data) {
        final listeners = _findListeners(event);
        for (var listener in listeners) {
          listener.handler(data);
        }
      });
    }
    return () {
      _listeners.remove(listener);
    };
  }
}

class EventListener extends Equatable {
  final String event;
  final EventHandler handler;
  const EventListener({
    required this.event,
    required this.handler,
  });

  @override
  List<Object?> get props => [event, handler];
}
