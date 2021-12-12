import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:telleo/data/models/message_packet_model.dart';
import 'package:telleo/domain/chats/chat_entity.dart';
import 'package:telleo/domain/chats/chats_event_handler.dart';
import 'package:telleo/domain/chats/message_entity.dart';
import 'package:telleo/domain/chats/message_packet.dart';
import 'package:telleo/domain/user/user_entity.dart';

import '../../domain/core/services/socket_service/socket_service.dart';

@LazySingleton(as: ChatsEventHandler)
class TelleoChatsEventHandler implements ChatsEventHandler {
  final SocketService socketService;
  TelleoChatsEventHandler(this.socketService);

  @override
  @disposeMethod
  void dispose() {
    _receiveMessageController.close();
  }

  final StreamController<MessagePacket> _receiveMessageController =
      StreamController();
  @override
  Stream<MessagePacket> onMessageReceived() async* {
    socketService.registerEventListener('receive-message', (data) {
      _receiveMessageController
          .add(MessagePacketModel.fromJson(data).toEntity());
    });
    yield* _receiveMessageController.stream;
  }

  @override
  void sendMessage(
      {required ChatEntity chat,
      required String content,
      required UserEntity currentUser}) {
    final packet = MessagePacket(
      to: chat.contact.uid,
      message: MessageEntity(content: content, sender: currentUser.uid),
      chatId: chat.id,
    );
    socketService.emit(
      'send-message',
      data: MessagePacketModel.fromEntity(packet).toJson(),
    );
  }
}
