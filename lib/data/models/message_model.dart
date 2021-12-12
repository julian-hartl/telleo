import 'package:json_annotation/json_annotation.dart';
import 'package:telleo/domain/chats/message_entity.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String content;
  final String sender;
  MessageModel({
    required this.content,
    required this.sender,
  });

  static List<MessageEntity> toEntityList(List<MessageModel> messages) =>
      messages.map((e) => e.toEntity()).toList();

  static List<MessageModel> fromEntityList(List<MessageEntity> messages) =>
      messages.map((message) => MessageModel.fromEntity(message)).toList();

  factory MessageModel.fromEntity(MessageEntity entity) =>
      MessageModel(content: entity.content, sender: entity.sender);

  MessageEntity toEntity() => MessageEntity(sender: sender, content: content);

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
