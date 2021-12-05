import 'package:injectable/injectable.dart';
import '../data_sets.dart';
import '../../domain/user/user_entity.dart';
import '../../domain/chats/chats_failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/chats/chats_repository.dart';
import '../../domain/chats/chat_entity.dart';

@LazySingleton(as: ChatsRepository)
class TelleoChatsRepository implements ChatsRepository {
  int _called = 0;

  @override
  Future<Either<ChatsFailure, List<ChatEntity>>> getChats() async {
    if (_called == 0) {
      _called++;
      return left(const ChatsFailure.noConnection());
    }
    await Future.delayed(const Duration(milliseconds: 300));
    _called++;
    return right(Datasets.chats);
  }
}
