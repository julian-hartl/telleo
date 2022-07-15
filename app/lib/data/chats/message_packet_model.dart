import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/domain/chats/message_packet.dart';

import 'message_model.dart';

part 'message_packet_model.freezed.dart';
part 'message_packet_model.g.dart';

@freezed
class MessagePacketModel with _$MessagePacketModel {
  const MessagePacketModel._();

  const factory MessagePacketModel({
    required String to,
    required MessageModel message,
    required String chatId,
  }) = _MessagePacketModel;

  factory MessagePacketModel.fromJson(Map<String, dynamic> json) =>
      _$MessagePacketModelFromJson(json);

  MessagePacket toEntity() =>
      MessagePacket(to: to, message: message.toEntity(), chatId: chatId);

  factory MessagePacketModel.fromEntity(MessagePacket packet) =>
      MessagePacketModel(
          to: packet.to,
          message: MessageModel.fromEntity(packet.message),
          chatId: packet.chatId);
}
