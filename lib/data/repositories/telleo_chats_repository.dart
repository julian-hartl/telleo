import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

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

  TelleoChatsRepository(this.apiService, this.userBloc);

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
}
