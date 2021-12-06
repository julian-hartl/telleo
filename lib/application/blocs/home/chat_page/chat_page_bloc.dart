import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/application/blocs/home/chats_page/chats_page_bloc.dart';
import 'package:telleo/domain/chats/chat_entity.dart';
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
    on<ChatPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  bool currentUserIsSender(UniqueId senderUid) {
    return state.currentUser.uid.getOrCrash() == senderUid.getOrCrash();
  }
}
