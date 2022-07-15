import 'package:telleo/domain/chats/chat_entity.dart';
import 'package:telleo/domain/user/user_entity.dart';

import 'message_packet.dart';

abstract class ChatsEventHandler {
  Stream<MessagePacket> onMessageReceived();
  void dispose();
  void sendMessage({
    required String chatId,
    required List<String> to,
    required String content,
    required UserEntity currentUser,
  });
}
