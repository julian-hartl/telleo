import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../loader/chat_bloc.dart';
import '../../user/loader/user_bloc.dart';
import '../../../failures/chat_failure_bloc.dart';
import '../../../../socket_event_handlers/chat_event_handler.dart';
import '../../../../../data/models/message_model.dart';
import '../../../../../data/packets/message_packet.dart';
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
  final ChatEventHandler chatEventHandler;
  final UserBloc userBloc;
  final ChatsRepository chatsRepository;
  final ChatFailureBloc chatFailureBloc;

  ChatActorBloc(this.log, this.chatBloc, this.chatEventHandler, this.userBloc,
      this.chatsRepository, this.chatFailureBloc)
      : super(const ChatActorState.initial()) {
    on<_AddMessage>((event, emit) {
      final chat = event.chat;
      final content = event.message.content;
      final sender = event.message.sender;
      chatEventHandler.sendMessage(
        packet: MessagePacket(
          to: chat.contact.uid,
          message: MessageModel(content: content, sender: sender),
          chatId: chat.id,
        ),
      );
      add(_UpdateChat(
          chat.copyWith(messages: [...chat.messages, event.message])));
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

      final result = await chatsRepository.updateChat(chatToUpdate);

      result.fold((failure) {
        failure.map(
            serverError: (_) =>
                chatFailureBloc.add(const ChatFailureEvent.serverError()),
            noConnection: (_) =>
                chatFailureBloc.add(const ChatFailureEvent.noConnection()));
      }, (_) {
        chatBloc.add(ChatEvent.updateChats(updatedChats));
      });
    });
  }
}
