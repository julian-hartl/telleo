import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import '../../../../../domain/chats/chat_entity.dart';
import '../../../../../domain/chats/chats_failures.dart';
import '../../../../../domain/chats/chats_repository.dart';
import '../../../../../domain/core/services/logger.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

@lazySingleton
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ILogger log;
  final ChatsRepository chatsRepository;

  Future<KtList<ChatEntity>> getChats() async {
    if (state is _LoadingSuccess) {
      return (state as _LoadingSuccess).chats;
    }
    final Completer<KtList<ChatEntity>> completer = Completer();

    Future.delayed(const Duration(seconds: 10), () {
      if (!completer.isCompleted) {
        throw ErrorHint('Getting chats timeout.');
      }
    });

    StreamSubscription? sub;
    sub = stream.listen((state) {
      if (state is _LoadingSuccess) {
        completer.complete(state.chats);
        sub?.cancel();
      }
    });
    return completer.future;
  }

  ChatBloc(this.log, this.chatsRepository) : super(const ChatState.initial()) {
    on<_UpdateChats>((event, emit) async {
      emit(ChatState.loadingSuccess(event.chats));
    });
    on<_LoadChats>((event, emit) async {
      log.logInfo('Loading chats');
      emit(const ChatState.loadInProgress());
      final chatsResult = await chatsRepository.getChats();
      chatsResult.fold((failure) {
        emit(ChatState.loadingFailure(failure));
      }, (chats) {
        emit(ChatState.loadingSuccess(chats.toImmutableList()));
      });
    });
  }
}
