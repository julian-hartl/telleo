import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/domain/chats/message_entity.dart';
import 'package:telleo/domain/core/base/entity.dart';

part 'message_packet.freezed.dart';

@freezed
class MessagePacket extends Entity with _$MessagePacket {
  const MessagePacket._();

  const factory MessagePacket({
    required String to,
    required MessageEntity message,
    required String chatId,
  }) = _MessagePacket;

  @override
  // TODO: implement props
  List<Object?> get props => [to, message, chatId];
}
