import 'package:telleo/data/models/user_model.dart';
import 'package:telleo/domain/chats/chat_entity.dart';
import 'package:telleo/domain/chats/message_entity.dart';

final testUser = const UserModel(
  name: 'Julian',
  uid: 'lsPVDPcQOJEnYdKNiDaL',
  email: 'muvhawnij@omzo.mz',
  profilePictureUrl:
      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
).toEntity();
final testChats = [
  ChatEntity(
      contact: testUser,
      messages: [MessageEntity(sender: testUser, content: '')])
];
