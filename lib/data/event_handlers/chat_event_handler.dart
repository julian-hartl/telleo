import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:telleo/domain/core/services/logger.dart';
import '../models/message_packet_model.dart';
import '../../domain/chats/chat_entity.dart';
import '../../domain/chats/chats_event_handler.dart';
import '../../domain/chats/message_entity.dart';
import '../../domain/chats/message_packet.dart';
import '../../domain/user/user_entity.dart';

import '../../domain/core/services/socket_service/socket_service.dart';

@LazySingleton(as: ChatsEventHandler)
class TelleoChatsEventHandler implements ChatsEventHandler {
  final SocketService socketService;
  final ILogger logger;
  TelleoChatsEventHandler(this.socketService, this.logger) {
    registerEventHandlers();
  }

  @override
  @disposeMethod
  void dispose() {
    _receiveMessageController.close();
  }

  final StreamController<MessagePacket> _receiveMessageController =
      StreamController.broadcast();
  @override
  Stream<MessagePacket> onMessageReceived() {
    return _receiveMessageController.stream;
  }

  void registerEventHandlers() {
    socketService.registerEventListener('receive-message', (data) {
      _receiveMessageController
          .add(MessagePacketModel.fromJson(data).toEntity());
    });
  }

  @override
  void sendMessage(
      {required String chatId,
      required List<String> to,
      required String content,
      required UserEntity currentUser}) {
    final packet = MessagePacket(
      to: to[0],
      message: MessageEntity(content: content, sender: currentUser.uid),
      chatId: chatId,
    );
    socketService.emit(
      'send-message',
      data: MessagePacketModel.fromEntity(packet).toJson(),
    );
  }
}
