import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../chats_page/chats_page_bloc.dart';
import '../../../../domain/chats/chat_entity.dart';
import '../../../../domain/core/services/logger.dart';
import '../../../../domain/core/services/socket_service/socket_service.dart';
import '../../../../domain/user/user_entity.dart';
import '../../../../domain/user/user_state.dart';
import '../../../../utils/dependencies.dart';

part 'chat_page_event.dart';
part 'chat_page_state.dart';
part 'chat_page_bloc.freezed.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  ChatPageBloc({required ChatEntity chat})
      : super(
          ChatPageState.initial(
            chat: chat,
            currentUser: app.get<UserState>().getOrCrash(),
          ),
        ) {
    on<_OnMessageReceieved>((event, emit) {
      app.get<ILogger>().logInfo(event.message);
    });
    on<_SendMessage>((event, emit) {
      app.get<SocketService>().emit(
        'send-message',
        data: {'message': event.message, 'to': state.chat.contact.uid},
      );
    });
    app.get<SocketService>().on("message", (data) {
      app.get<ILogger>().logInfo(data.toString());

      add(_OnMessageReceieved(data['message']));
    });
  }

  bool currentUserIsSender(String senderUid) {
    return state.currentUser.uid == senderUid;
  }
}
