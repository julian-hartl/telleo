import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../loader/chat_bloc.dart';
import '../../user/loader/user_bloc.dart';
import '../../../failures/chat_failure_bloc.dart';
import '../../../../../data/event_handlers/chat_event_handler.dart';
import '../../../../../data/models/message_model.dart';
import '../../../../../domain/chats/chat_entity.dart';
import '../../../../../domain/chats/chats_repository.dart';
import '../../../../../domain/chats/message_entity.dart';
import '../../../../../domain/core/services/logger.dart';
import 'package:kt_dart/collection.dart';

part 'chat_actor_event.dart';
part 'chat_actor_state.dart';
part 'chat_actor_bloc.freezed.dart';

@lazySingleton
class ChatActorBloc extends Bloc<ChatActorEvent, ChatActorState> {
  final ILogger log;
  final ChatBloc chatBloc;
  final UserBloc userBloc;
  final ChatsRepository chatsRepository;
  final ChatFailureBloc chatFailureBloc;

  ChatActorBloc(this.log, this.chatBloc, this.userBloc, this.chatsRepository,
      this.chatFailureBloc)
      : super(const ChatActorState.initial()) {
    on<_AddMessage>((event, emit) async {
      final chatId = event.chatId;
      final content = event.message;
      final sender = event.sender;

      final chat = (await chatBloc.getChats())
          .asList()
          .firstWhereOrNull((chat) => chat.id == chatId);
      if (chat == null) {
        return chatFailureBloc
            .add(const ChatFailureEvent.couldNotSendMessage());
      }
      add(
        _UpdateChat(
          chat.copyWith(
            messages: [
              ...chat.messages,
              MessageEntity(sender: sender, content: content)
            ],
          ),
        ),
      );
    });
    on<_AddChat>((event, emit) {});
    on<_UpdateChat>((event, emit) async {
      final chatToUpdate = event.chat;
      final currentChats = (await chatBloc.getChats()).toMutableList().asList();

      final updatedChats = currentChats.map((chat) {
        if (chat.id == chatToUpdate.id) {
          return chatToUpdate;
        }
        return chat;
      }).toImmutableList();
      chatBloc.add(ChatEvent.updateChats(updatedChats));
    });
    chatsRepository.onMessageReceived().listen((packet) {
      add(ChatActorEvent.addMessage(
          message: packet.message.content,
          chatId: packet.chatId,
          sender: packet.message.sender));
    });
  }
}
