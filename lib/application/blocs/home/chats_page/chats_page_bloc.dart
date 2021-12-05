import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/domain/core/services/api_service/api_service.dart';
import '../../../../domain/core/dartz_option_ext.dart';
import '../../../../domain/user/user_entity.dart';
import '../../../../domain/user/user_state.dart';
import '../../../../domain/core/async_value.dart';
import '../../../../domain/core/services/logger.dart';
import '../../../../utils/dependencies.dart';
import '../../app/bloc/app_bloc.dart';

import '../../../../domain/chats/chat_entity.dart';

part 'chats_page_event.dart';
part 'chats_page_state.dart';
part 'chats_page_bloc.freezed.dart';

class ChatsPageBloc extends Bloc<ChatsPageEvent, ChatsPageState> {
  final AppBloc appBloc;
  @visibleForTesting
  late final StreamSubscription<AppState> appStateStream;

  final ApiService apiService;

  ChatsPageBloc(this.appBloc, this.apiService)
      : super(
          ChatsPageState.initial(
            appBloc.state.user.map(
              data: (data) => AsyncValue.data(
                data.data.getOrCrash(),
              ),
              loading: (l) => const AsyncValue.loading(),
              error: (err) => AsyncValue.error(err.message),
            ),
          ),
        ) {
    appStateStream = appBloc.stream.listen((event) {
      final chats = event.chats;
      final AsyncValue<List<ChatEntity>> chatsResult = chats.map(
        data: (data) => data,
        loading: (_) => const AsyncValue.loading(),
        error: (value) => AsyncValue.error(value.message),
      );

      add(_UpdateChats(chats: chatsResult));
    });

    appBloc.add(const AppEvent.updateChats());

    on<_UpdateChats>((event, emit) {
      emit(state.copyWith(chats: event.chats));
    });

    on<_Retry>((event, emit) {
      appBloc.add(const AppEvent.updateChats());
    });

    on<_UpdateTest>((event, emit) async {
      app.get<ILogger>().logInfo('Requesting from api...');
      final result = await apiService.get(path: "/api/");
      app.get<ILogger>().logInfo('Got from api: $result');

      result.fold(
          (l) => emit(state.copyWith(test: const AsyncValue.data('Failure'))),
          (json) {
        emit(state.copyWith(test: AsyncValue.data(json['text'])));
      });
    });
    add(const _UpdateTest());
  }

  @override
  Future<void> close() {
    appStateStream.cancel();
    return super.close();
  }
}
