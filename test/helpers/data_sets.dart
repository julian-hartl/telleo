import 'package:telleo/domain/entities/chat_entity.dart';
import 'package:telleo/domain/entities/user_entity.dart';

final testUser = UserEntity(
    name: 'Julian', uid: 'lsPVDPcQOJEnYdKNiDaL', email: 'muvhawnij@omzo.mz');
final chats = [
  ChatEntity(contact: testUser, messages: const ['Hello'])
];
