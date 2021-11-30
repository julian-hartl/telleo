import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/domain/core/services/logger.dart';
import 'package:telleo/utils/dependencies.dart';
import '../../app/bloc/app_bloc.dart';

import '../../../../domain/chats/chat_entity.dart';

part 'chats_page_event.dart';
part 'chats_page_state.dart';
part 'chats_page_bloc.freezed.dart';

class ChatsPageBloc extends Bloc<ChatsPageEvent, ChatsPageState> {
  final AppBloc appBloc;
  @visibleForTesting
  late final StreamSubscription<AppState> appStateStream;

  ChatsPageBloc(this.appBloc) : super(ChatsPageState.initial()) {
    appStateStream = appBloc.stream.listen((event) {
      app.get<ILogger>().logInfo('Listening to AppState');
      final chats = event.chats;
      chats.fold(() => null, (a) {
        if (a != state.chats) {
          add(ChatsPageEvent.updateChats(chats: a));
        }
      });
    });
    appBloc.add(const AppEvent.updateChats());

    on<_UpdateChats>((event, emit) {
      emit(state.copyWith(chats: event.chats, loading: false));
    });
  }

  @override
  Future<void> close() {
    appStateStream.cancel();
    return super.close();
  }
}
