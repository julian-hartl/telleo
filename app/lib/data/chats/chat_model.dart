import 'package:json_annotation/json_annotation.dart';
import 'package:kt_dart/kt.dart';
import '../../application/blocs/app/user/loader/user_bloc.dart';
import '../users/user_model.dart';
import '../../domain/chats/chat_entity.dart';
import '../../domain/user/user_entity.dart';
import '../../utils/dependencies.dart';

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

  static Future<List<ChatEntity>> toEntities(List<ChatModel> chats) async =>
      Future.wait(chats.map((chat) async => await chat.toEntity()).toList());

  Future<UserEntity> getContact() async {
    final uid = (await app.get<UserBloc>().getCurrentUser()).uid;
    final contact = users.firstWhere((user) => user.uid != uid).toEntity();
    return contact;
  }

  static Future<ChatModel> fromEntity(ChatEntity entity) async => ChatModel(
        users: [
          UserModel.fromEntity(entity.contact),
          UserModel.fromEntity(await app.get<UserBloc>().getCurrentUser())
        ],
        messages: MessageModel.fromEntityList(entity.messages),
        id: entity.id,
      );

  Future<ChatEntity> toEntity() async => ChatEntity(
      contact: await getContact(),
      messages: MessageModel.toEntityList(messages),
      id: id);

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
