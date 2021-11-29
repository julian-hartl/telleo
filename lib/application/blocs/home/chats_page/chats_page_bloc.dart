import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/change_notifier.dart';

import '../../../../domain/chats/chats_state.dart';
import '../../../../domain/core/async_value.dart';
import '../../../../domain/core/services/logger.dart';
import '../../../../utils/dependencies.dart';
import '../../../../domain/chats/chat_entity.dart';

part 'chats_page_event.dart';
part 'chats_page_state.dart';
part 'chats_page_bloc.freezed.dart';

class ChatsPageBloc extends Bloc<ChatsPageEvent, ChatsPageState> {
  @visibleForTesting
  late final RemoveListener removeChatsStateListener;
  ChatsPageBloc() : super(ChatsPageState.initial()) {
    removeChatsStateListener = app.get<ChatsState>().addListener((state) {
      state.map(
        loading: (_) {
          add(const ChatsPageEvent.loadingChats());
        },
        error: (err) {
          add(ChatsPageEvent.error(message: err.message));
        },
        data: (_) {
          add(const ChatsPageEvent.retrievedChats());
        },
      );
    });
    on<ChatsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void dispose() {
    try {
      removeChatsStateListener();
    } catch (_) {
      app.get<ILogger>().logError('Could not remove chatsStateListener');
    }
  }
}
