import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import '../../../../../domain/chats/chat_entity.dart';
import '../../../../../domain/chats/chats_repository.dart';
import '../../../../../domain/chats/message_entity.dart';
import '../../../../../domain/core/services/logger.dart';
import '../../../failures/chat_failure_bloc.dart';
import '../../user/loader/user_bloc.dart';
import '../loader/chat_bloc.dart';

part 'chat_actor_bloc.freezed.dart';
part 'chat_actor_event.dart';
part 'chat_actor_state.dart';

/*
* Note that this blocs only task is to perform mutations on the currently in memory stored chats (not to save data to any kind of database)
 */
@singleton
class ChatActorBloc extends Bloc<ChatActorEvent, ChatActorState> {
  final ILogger logger;
  final ChatBloc chatBloc;
  final UserBloc userBloc;
  final ChatsRepository chatsRepository;
  final ChatFailureBloc chatFailureBloc;

  ChatActorBloc(this.logger, this.chatBloc, this.userBloc, this.chatsRepository,
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
    on<_AddChat>((event, emit) async {
      final chat = event.chat;
      final currentChats = (await chatBloc.getChats()).toMutableList().asList();
      chatBloc.add(
          ChatEvent.updateChats([...currentChats, chat].toImmutableList()));
    });
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
    _messageReceivedSub = chatsRepository.onMessageReceived().listen((packet) {
      add(
        ChatActorEvent.addMessage(
          message: packet.message.content,
          chatId: packet.chatId,
          sender: packet.message.sender,
        ),
      );
    });
  }

  late final StreamSubscription _messageReceivedSub;

  @override
  Future<void> close() async {
    await _messageReceivedSub.cancel();
    return super.close();
  }
}
