import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/application/blocs/app/chat/loader/chat_bloc.dart';
import 'package:telleo/application/blocs/app/user/loader/user_bloc.dart';
import 'package:telleo/application/socket_event_handlers/chat_event_handler.dart';
import 'package:telleo/data/models/message_model.dart';
import 'package:telleo/data/packets/message_packet.dart';
import 'package:telleo/domain/chats/chat_entity.dart';
import 'package:telleo/domain/chats/message_entity.dart';
import 'package:telleo/domain/core/services/logger.dart';

part 'chat_actor_event.dart';
part 'chat_actor_state.dart';
part 'chat_actor_bloc.freezed.dart';

@lazySingleton
class ChatActorBloc extends Bloc<ChatActorEvent, ChatActorState> {
  final ILogger log;
  final ChatBloc chatBloc;
  final ChatEventHandler chatEventHandler;
  final UserBloc userBloc;

  ChatActorBloc(this.log, this.chatBloc, this.chatEventHandler, this.userBloc)
      : super(const ChatActorState.initial()) {
    on<_AddMessage>((event, emit) async {
      final currentUser = await userBloc.getCurrentUser();
      final chat = event.chat;
      final content = event.content;
      chatEventHandler.sendMessage(
        packet: MessagePacket(
          to: chat.contact.uid,
          message: MessageModel(
            content: content,
            sender: currentUser.uid,
          ),
          chatId: chat.id,
        ),
      );
      // chatBloc.add(ChatEvent.updateChats(updatedChats));
    });
    on<_AddChat>((event, emit) {});
    on<_UpdateChat>((event, emit) {});
  }
}
