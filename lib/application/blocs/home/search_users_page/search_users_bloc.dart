import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/application/blocs/app/bloc/app_bloc.dart';
import 'package:telleo/domain/chats/chat_entity.dart';
import 'package:telleo/domain/chats/chats_repository.dart';
import 'package:telleo/domain/chats/chats_state.dart';
import 'package:telleo/domain/core/async_value.dart';
import 'package:telleo/domain/user/user_entity.dart';
import 'package:telleo/domain/user/user_repository.dart';
import 'package:telleo/utils/dependencies.dart';

part 'search_users_event.dart';
part 'search_users_state.dart';
part 'search_users_bloc.freezed.dart';

@lazySingleton
class SearchUsersBloc extends Bloc<SearchUsersEvent, SearchUsersState> {
  final UserRepository userRepository;
  final ChatsRepository chatsRepository;
  final AppBloc appBloc;
  SearchUsersBloc(this.userRepository, this.chatsRepository, this.appBloc)
      : super(SearchUsersState.initial()) {
    on<_CreateChat>((event, emit) async {
      final withId = event.withId;
      final result = await chatsRepository.createChat(withId);
      result.fold((failure) {}, (chat) {
        appBloc.add(AppEvent.addChat(chat: chat));
        add(const SearchUsersEvent.clearQuery());
      });
    });
    on<_ClearQuery>((event, emit) {
      emit(state.copyWith(
          query: '', showSearch: false, users: const AsyncValue.data([])));
    });
    on<_OnQueryChanged>((event, emit) async {
      final query = event.query;
      emit(state.copyWith(query: query, showSearch: query.isNotEmpty));

      if (query.isNotEmpty) {
        emit(state.copyWith(users: const AsyncValue.loading()));
        final searchResult = await userRepository.searchUsers(query: query);
        searchResult.fold((failure) {
          emit(
            state.copyWith(
              users: AsyncValue.error(
                failure.map(
                  serverError: (_) => 'Internal server error.',
                  noConnection: (_) => 'Please check your connection.',
                ),
              ),
            ),
          );
        }, (users) {
          emit(state.copyWith(
              users: AsyncValue.data(_removeAlreadyExistingChats(users))));
        });
      }
    });
  }

  bool _hasChatWith(UserEntity contact, List<ChatEntity> chats) {
    final uid = contact.uid;

    for (var chat in chats) {
      if (chat.contact.uid == uid) {
        return true;
      }
    }
    return false;
  }

  List<UserEntity> _removeAlreadyExistingChats(List<UserEntity> users) {
    final result = app.get<ChatsState>().value.onData((chats) {
      for (var chat in chats) {
        users.removeWhere((user) => _hasChatWith(chat.contact, chats));
      }
      return users;
    });
    if (result != null) return result;
    return users;
  }
}
