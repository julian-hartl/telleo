import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/application/blocs/home/chats_page/chats_page_bloc.dart';
import 'package:telleo/domain/chats/chat_entity.dart';
import 'package:telleo/domain/core/services/logger.dart';
import 'package:telleo/domain/core/services/socket_service/socket_service.dart';
import 'package:telleo/domain/user/user_entity.dart';
import 'package:telleo/domain/user/user_state.dart';
import 'package:telleo/utils/dependencies.dart';

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
        'message',
        data: {
          'message': event.message,
          'to': state.currentUser.uid.getOrCrash()
        },
      );
    });
    app.get<SocketService>().on("message", (data) {
      app.get<ILogger>().logInfo(data.toString());

      add(_OnMessageReceieved(data['message']));
    });
  }

  bool currentUserIsSender(UniqueId senderUid) {
    return state.currentUser.uid.getOrCrash() == senderUid.getOrCrash();
  }
}
