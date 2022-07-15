import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_entity.dart';
import 'message_entity.dart';

part 'chat_entity.freezed.dart';

@freezed
class ChatEntity with _$ChatEntity {
  const factory ChatEntity({
    required UserEntity contact,
    required List<MessageEntity> messages,
    required String id,
  }) = _ChatEntity;
}
