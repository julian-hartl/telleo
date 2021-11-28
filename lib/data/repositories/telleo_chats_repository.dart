import 'package:injectable/injectable.dart';
import 'package:telleo/domain/chats/chats_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:telleo/domain/chats/chats_repository.dart';
import 'package:telleo/domain/entities/chat_entity.dart';

@LazySingleton(as: ChatsRepository)
class TelleoChatsRepository implements ChatsRepository {
  @override
  Future<Either<ChatsFailure, List<ChatEntity>>> getChats() async {
    return left(const ChatsFailure.serverError());
  }
}
