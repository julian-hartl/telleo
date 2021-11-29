import 'package:injectable/injectable.dart';
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
          contact: UserEntity(
            name: Name('Lizzie Walker'),
            uid: UniqueId.fromExistingUid('WXxJvAdQMkvYzCZOstbG'),
            email: EmailAdress('kosugow@ote.ec'),
          ),
          messages: ['Helo'])
    ]);
  }
}
