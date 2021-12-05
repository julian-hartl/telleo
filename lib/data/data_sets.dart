import 'package:dartz/dartz.dart';

import '../domain/chats/chat_entity.dart';
import '../domain/user/user_entity.dart';

abstract class Datasets {
  static UserEntity user = UserEntity(
    name: Name('Lizzie Walker'),
    uid: UniqueId.fromExistingUid('WXxJvAdQMkvYzCZOstbG'),
    email: EmailAdress('kosugow@ote.ec'),
    profilePictureUrl: some(ProfilePictureUrl(
      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
    )),
  );
  static List<ChatEntity> chats = [
    ChatEntity(
      contact: user,
      messages: const ['Helo'],
    ),
    ChatEntity(
      contact: user,
      messages: const ['Helo'],
    ),
  ];
}
