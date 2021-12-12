import 'package:injectable/injectable.dart';
import '../../data/packets/message_packet.dart';
import '../../domain/core/services/socket_service/socket_service.dart';

@lazySingleton
class ChatEventHandler {
  final SocketService socketService;
  ChatEventHandler(this.socketService);

  void sendMessage({required MessagePacket packet}) {
    socketService.emit(
      'send-message',
      data: packet.toJson(),
    );
  }
}
