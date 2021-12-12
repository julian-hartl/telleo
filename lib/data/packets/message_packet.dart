import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/message_model.dart';

part 'message_packet.freezed.dart';
part 'message_packet.g.dart';

@freezed
class MessagePacket with _$MessagePacket {
  const MessagePacket._();

  const factory MessagePacket(
      {required String to,
      required MessageModel message,
      required String chatId}) = _MessagePacket;

  factory MessagePacket.fromJson(Map<String, dynamic> json) =>
      _$MessagePacketFromJson(json);
}
