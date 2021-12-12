import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:telleo/domain/chats/chats_repository.dart';
import '../../app/user/loader/user_bloc.dart';
import '../../failures/chat_failure_bloc.dart';

import '../../../../domain/chats/chat_entity.dart';
import '../../../../domain/chats/message_entity.dart';
import '../../../../utils/dependencies.dart';
import '../../app/chat/actor/chat_actor_bloc.dart';

part 'chat_page_bloc.freezed.dart';
part 'chat_page_event.dart';
part 'chat_page_state.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  final ChatEntity chat;
  final ChatsRepository chatsRepository;
  List<MessageEntity> _currentMessages = [];
  ChatPageBloc(this.chat, this.chatsRepository)
      : super(
          const ChatPageState.initial(),
        ) {
    on<_SendMessage>((event, emit) async {
      try {
        final currentUser = await app.get<UserBloc>().getCurrentUser();
        final message =
            MessageEntity(sender: currentUser.uid, content: event.message);
        chatsRepository.sendMessage(chat, message.content);

        app.get<ChatActorBloc>().add(
              ChatActorEvent.addMessage(
                chatId: event.currentChat.id,
                message: event.message,
                sender: currentUser.uid,
              ),
            );
        add(_UpdateMessages([..._currentMessages, message].toImmutableList()));
      } catch (_) {
        app
            .get<ChatFailureBloc>()
            .add(const ChatFailureEvent.couldNotSendMessage());
      }
    });
    on<_UpdateMessages>((event, emit) {
      _currentMessages = event.messages.toMutableList().asList();
      emit(const ChatPageState.loadingMessages());
      emit(ChatPageState.loadingSuccess(event.messages));
    });
    add(ChatPageEvent.updateMessages(chat.messages.toImmutableList()));
    app
        .get<ChatsRepository>()
        .onMessageReceived(chatId: chat.id)
        .listen((packet) {
      add(
        _UpdateMessages(
          [
            ..._currentMessages,
            MessageEntity(
                sender: packet.message.sender, content: packet.message.content)
          ].toImmutableList(),
        ),
      );
    });
  }
}
