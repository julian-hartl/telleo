import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/domain/chats/chats_event_handler.dart';
import 'package:telleo/domain/chats/message_entity.dart';
import 'package:telleo/domain/chats/message_packet.dart';

import '../../application/blocs/app/user/loader/user_bloc.dart';
import '../../config.dart';
import '../../domain/chats/chat_entity.dart';
import '../../domain/chats/chats_failures.dart';
import '../../domain/chats/chats_repository.dart';
import '../../domain/core/services/api_service/api_service.dart';
import '../models/chat_model.dart';

@LazySingleton(as: ChatsRepository)
class TelleoChatsRepository implements ChatsRepository {
  final ApiService apiService;
  final UserBloc userBloc;
  final ChatsEventHandler chatsEventHandler;

  TelleoChatsRepository(this.apiService, this.userBloc, this.chatsEventHandler);

  @override
  Future<Either<ChatsFailure, List<ChatEntity>>> getChats() async {
    final uid = (await userBloc.getCurrentUser()).uid;
    final response = await apiService.get(path: '${Config.apiPath}/chats/$uid');
    return await response.fold((failure) {
      return left(failure.maybeWhen(
          internalServerError: () => const ChatsFailure.serverError(),
          orElse: () => const ChatsFailure.serverError()));
    }, (json) async {
      final chats = (json['chats'] as List)
          .map((chat) => ChatModel.fromJson(chat))
          .toList();
      return right(await ChatModel.toEntities(chats));
    });
  }

  @override
  Future<Either<ChatsFailure, ChatEntity>> createChat(String withId) async {
    final uid = (await userBloc.getCurrentUser()).uid;

    final users = [uid, withId];
    final response = await apiService
        .post(path: '${Config.apiPath}/chats/create', data: {'users': users});
    return await response.fold((failure) {
      return left(failure.maybeWhen(
          internalServerError: () => const ChatsFailure.serverError(),
          orElse: () => const ChatsFailure.serverError()));
    }, (json) async {
      return right(await ChatModel.fromJson(json['chat']).toEntity());
    });
  }

  @override
  Future<Either<ChatsFailure, ChatEntity>> updateChat(ChatEntity chat) async {
    final response = await apiService.update(
        data: {'chat': (await ChatModel.fromEntity(chat)).toJson()},
        path: '${Config.apiPath}/chats/update');
    return response.fold((failure) {
      return left(
          failure.maybeWhen(orElse: () => const ChatsFailure.serverError()));
    }, (json) async {
      final updatedChat = await ChatModel.fromJson(json['chat']).toEntity();
      return right(updatedChat);
    });
  }

  @override
  Stream<MessagePacket> onMessageReceived({String? chatId}) {
    return chatsEventHandler.onMessageReceived().where((packet) {
      if (chatId != null) {
        return packet.chatId == chatId;
      }
      return true;
    }).asBroadcastStream();
  }

  @override
  Future<Either<ChatsFailure, Unit>> sendMessage({
    required String chatId,
    required List<String> to,
    required String content,
  }) async {
    final currentUser = await userBloc.getCurrentUser();
    chatsEventHandler.sendMessage(
      chatId: chatId,
      to: to,
      content: content,
      currentUser: currentUser,
    );
    return right(unit);
  }
}
