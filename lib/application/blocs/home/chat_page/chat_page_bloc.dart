import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import '../../../../domain/chats/chat_entity.dart';
import '../../../../domain/chats/message_entity.dart';
import '../../../../utils/dependencies.dart';
import '../../app/chat/actor/chat_actor_bloc.dart';

part 'chat_page_bloc.freezed.dart';
part 'chat_page_event.dart';
part 'chat_page_state.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  ChatPageBloc()
      : super(
          const ChatPageState.initial(),
        ) {
    on<_SendMessage>((event, emit) {
      app.get<ChatActorBloc>().add(
            ChatActorEvent.addMessage(
              chat: event.currentChat,
              content: event.message,
            ),
          );
    });
  }
}
