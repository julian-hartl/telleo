import 'package:json_annotation/json_annotation.dart';
import 'package:telleo/data/models/user_model.dart';
import 'package:telleo/domain/chats/chat_entity.dart';
import 'package:telleo/domain/user/user_entity.dart';
import 'package:telleo/domain/user/user_state.dart';
import 'package:telleo/utils/dependencies.dart';

import 'message_model.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  final List<UserModel> users;
  final List<MessageModel> messages;
  final String id;
  ChatModel({
    required this.users,
    required this.messages,
    required this.id,
  });

  static List<ChatEntity> toEntities(List<ChatModel> chats) =>
      chats.map((chat) => chat.toEntity()).toList();

  UserEntity getContact() {
    final contact = users
        .firstWhere((user) => user.uid == app.get<UserState>().getOrCrash().uid)
        .toEntity();
    return contact;
  }

  ChatEntity toEntity() => ChatEntity(
      contact: getContact(), messages: MessageModel.toEntityList(messages));

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
