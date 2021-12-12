import 'package:telleo/domain/chats/chat_entity.dart';
import 'package:telleo/domain/user/user_entity.dart';

import 'message_packet.dart';

abstract class ChatsEventHandler {
  Stream<MessagePacket> onMessageReceived();
  void dispose();
  void sendMessage({
    required ChatEntity chat,
    required String content,
    required UserEntity currentUser,
  });
}
