import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
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
  final CurrentChatsState chatsState;
  final UserRepository userRepository;
  final ChatsRepository chatsRepository;

  AppBloc(
    this.userState,
    this.chatsState,
    this.userRepository,
    this.chatsRepository,
  ) : super(AppState.initial()) {
    on<_UpdateUser>((event, emit) async {
      final user = event.user;
      late final Option<UserEntity> result;
      if (user != null) {
        result = user;
      } else {
        final currentUserResult = await userRepository.getCurrentUser();
        currentUserResult.fold(
          (l) => null,
          (userOption) => result = userOption,
        );
      }
      userState.update(result);
      emit(state.copyWith(user: result));
    });
    on<_UpdateChats>((event, emit) async {
      final chats = event.chats;

      late final Option<List<ChatEntity>> result;
      if (chats != null) {
        result = chats;
      } else {
        final chatsResult = await chatsRepository.getChats();
        chatsResult.fold(
          (l) => null,
          (chats) => result = some(chats),
        );
      }
      chatsState.update(result);
      emit(state.copyWith(chats: result));
    });
  }
}
