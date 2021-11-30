import 'package:telleo/data/models/user_model.dart';
import 'package:telleo/domain/chats/chat_entity.dart';

final testUser = const UserModel(
        name: 'Julian', uid: 'lsPVDPcQOJEnYdKNiDaL', email: 'muvhawnij@omzo.mz')
    .toEntity();
final testChats = [
  ChatEntity(contact: testUser, messages: const ['Hello'])
];
