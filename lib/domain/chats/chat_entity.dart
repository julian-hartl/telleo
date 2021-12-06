import 'message_entity.dart';

import '../core/base/entity.dart';
import '../user/user_entity.dart';

class ChatEntity extends Entity {
  final UserEntity contact;
  final List<MessageEntity> messages;

  ChatEntity({
    required this.contact,
    required this.messages,
  });

  @override
  List<Object?> get props => [contact, messages];
}
