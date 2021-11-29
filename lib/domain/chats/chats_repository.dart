import 'package:dartz/dartz.dart';
import 'chats_failures.dart';
import 'chat_entity.dart';

abstract class ChatsRepository {
  Future<Either<ChatsFailure, List<ChatEntity>>> getChats();
}
