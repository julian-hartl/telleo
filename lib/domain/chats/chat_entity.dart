import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/base/entity.dart';
import '../user/user_entity.dart';
import 'message_entity.dart';

part 'chat_entity.freezed.dart';

@freezed
class ChatEntity extends Entity with _$ChatEntity {
  const ChatEntity._();

  const factory ChatEntity({
    required UserEntity contact,
    required List<MessageEntity> messages,
    required String id,
  }) = _ChatEntity;

  @override
  List<Object?> get props => [contact, messages, id];
}
