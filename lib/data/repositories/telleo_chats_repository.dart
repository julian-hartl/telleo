import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/data/models/chat_model.dart';
import 'package:telleo/domain/core/services/api_service/api_service.dart';

import '../../config.dart';
import '../../domain/chats/chat_entity.dart';
import '../../domain/chats/chats_failures.dart';
import '../../domain/chats/chats_repository.dart';
import '../../domain/user/user_state.dart';
import '../../utils/dependencies.dart';

@LazySingleton(as: ChatsRepository)
class TelleoChatsRepository implements ChatsRepository {
  final ApiService apiService;

  TelleoChatsRepository(this.apiService);

  @override
  Future<Either<ChatsFailure, List<ChatEntity>>> getChats() async {
    final uid = app.get<UserState>().getOrCrash().uid;
    final response = await apiService.get(path: '${Config.apiPath}/chats/$uid');
    return response.fold((failure) {
      return left(failure.maybeWhen(
          internalServerError: () => const ChatsFailure.serverError(),
          orElse: () => const ChatsFailure.serverError()));
    }, (json) {
      final chats = (json['chats'] as List)
          .map((chat) => ChatModel.fromJson(chat))
          .toList();
      return right(ChatModel.toEntities(chats));
    });
  }

  @override
  Future<Either<ChatsFailure, ChatEntity>> createChat(String withId) async {
    final uid = app.get<UserState>().getOrCrash().uid;
    final users = [uid, withId];
    final response = await apiService
        .post(path: '${Config.apiPath}/chats/create', data: {'users': users});
    return response.fold((failure) {
      return left(failure.maybeWhen(
          internalServerError: () => const ChatsFailure.serverError(),
          orElse: () => const ChatsFailure.serverError()));
    }, (json) {
      return right(ChatModel.fromJson(json['chat']).toEntity());
    });
  }
}
