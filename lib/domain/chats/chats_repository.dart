import 'package:dartz/dartz.dart';
import 'package:telleo/domain/chats/message_entity.dart';
import 'package:telleo/domain/chats/message_packet.dart';
import 'chats_failures.dart';
import 'chat_entity.dart';

abstract class ChatsRepository {
  Future<Either<ChatsFailure, List<ChatEntity>>> getChats();
  Future<Either<ChatsFailure, ChatEntity>> createChat(String withId);
  Future<Either<ChatsFailure, ChatEntity>> updateChat(ChatEntity chat);
  Future<Either<ChatsFailure, Unit>> sendMessage({
    required String chatId,
    required List<String> to,
    required String content,
  });
  Stream<MessagePacket> onMessageReceived({String? chatId});
}
