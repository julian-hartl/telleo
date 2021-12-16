import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/domain/chats/message_entity.dart';

part 'message_packet.freezed.dart';

@freezed
class MessagePacket with _$MessagePacket {
  const factory MessagePacket({
    required String to,
    required MessageEntity message,
    required String chatId,
  }) = _MessagePacket;
}
