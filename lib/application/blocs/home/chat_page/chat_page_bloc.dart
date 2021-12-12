import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
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
  List<MessageEntity> _currentMessages = [];
  ChatPageBloc(this.chat)
      : super(
          const ChatPageState.initial(),
        ) {
    on<_SendMessage>((event, emit) async {
      try {
        final currentUser = await app.get<UserBloc>().getCurrentUser();
        final message =
            MessageEntity(sender: currentUser.uid, content: event.message);
        app.get<ChatActorBloc>().add(
              ChatActorEvent.addMessage(
                chat: event.currentChat,
                message: message,
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
  }
}
