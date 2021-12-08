import 'package:injectable/injectable.dart';
import '../../domain/chats/message_entity.dart';
import '../../domain/user/user_state.dart';
import '../../utils/dependencies.dart';
import '../data_sets.dart';
import '../../domain/user/user_entity.dart';
import '../../domain/chats/chats_failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/chats/chats_repository.dart';
import '../../domain/chats/chat_entity.dart';

@LazySingleton(as: ChatsRepository)
class TelleoChatsRepository implements ChatsRepository {
  @override
  Future<Either<ChatsFailure, List<ChatEntity>>> getChats() async {
    return right([
      ChatEntity(
        contact: Datasets.user,
        messages: [
          MessageEntity(
              sender: app.get<UserState>().getOrCrash(), content: 'Hello'),
          MessageEntity(sender: Datasets.user, content: 'Hello'),
          MessageEntity(sender: Datasets.user, content: 'Hello')
        ],
      ),
      ...Datasets.chats
    ]);
  }
}
