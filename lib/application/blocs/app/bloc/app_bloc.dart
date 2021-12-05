import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../../config.dart';
import '../../../../domain/core/services/logger.dart';
import '../../../../utils/dependencies.dart';
import '../../../../domain/core/async_value.dart';
import '../../../../domain/errors.dart';
import '../../../../domain/chats/chat_entity.dart';
import '../../../../domain/chats/chats_repository.dart';
import '../../../../domain/chats/chats_state.dart';
import '../../../../domain/user/user_entity.dart';
import '../../../../domain/user/user_repository.dart';
import '../../../../domain/user/user_state.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

@lazySingleton
class AppBloc extends Bloc<AppEvent, AppState> {
  final UserState userState;
  final ChatsState chatsState;
  final UserRepository userRepository;
  final ChatsRepository chatsRepository;

  AppBloc(
    this.userState,
    this.chatsState,
    this.userRepository,
    this.chatsRepository,
  ) : super(AppState.initial()) {
    on<_UpdateUser>((event, emit) async {
      emit(state.copyWith(user: const AsyncValue.loading()));
      final user = event.user;
      late final AsyncValue<Option<UserEntity>> result;
      if (user != null) {
        result = user;
      } else {
        final currentUserResult = await userRepository.getCurrentUser();
        result = currentUserResult.fold(
          (l) => AsyncValue.error(
            l.map(
              serverError: (_) => ErrorMessage.internalServerError,
              noConnection: (_) => ErrorMessage.connectionError,
            ),
          ),
          (userOption) => AsyncValue.data(userOption),
        );
      }
      if (result != state.user) {
        userState.update(result);
        emit(state.copyWith(user: result));
      }
    });
    on<_UpdateChats>((event, emit) async {
      emit(state.copyWith(chats: const AsyncValue.loading()));
      final chats = event.chats;

      late final AsyncValue<List<ChatEntity>> result;
      if (chats != null) {
        result = chats;
      } else {
        final chatsResult = await chatsRepository.getChats();
        result = chatsResult.fold(
          (l) => AsyncValue.error(
            l.map(
              serverError: (_) => ErrorMessage.internalServerError,
              noConnection: (_) => ErrorMessage.connectionError,
            ),
          ),
          (chats) => AsyncValue.data(chats),
        );
      }
      if (result != state.chats) {
        chatsState.update(result);
        emit(state.copyWith(chats: result));
      }
    });
  }
}
