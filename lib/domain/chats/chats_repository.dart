import 'package:dartz/dartz.dart';
import 'package:telleo/domain/chats/chats_failures.dart';
import 'package:telleo/domain/chats/chat_entity.dart';

abstract class ChatsRepository {
  Future<Either<ChatsFailure, List<ChatEntity>>> getChats();
}
