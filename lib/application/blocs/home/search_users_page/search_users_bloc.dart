import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import '../../app/chat/loader/chat_bloc.dart';
import '../../app/user/loader/user_bloc.dart';

import '../../../../domain/chats/chat_entity.dart';
import '../../../../domain/chats/chats_repository.dart';
import '../../../../domain/core/async_value.dart';
import '../../../../domain/user/user_entity.dart';
import '../../../../domain/user/user_repository.dart';
import '../../../../utils/dependencies.dart';

part 'search_users_bloc.freezed.dart';
part 'search_users_event.dart';
part 'search_users_state.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required bool chatAlreadyExists,
    required UserEntity user,
  }) = _SearchResult;
}

@lazySingleton
class SearchUsersBloc extends Bloc<SearchUsersEvent, SearchUsersState> {
  final UserRepository userRepository;
  final UserBloc userBloc;
  final ChatBloc chatBloc;
  SearchUsersBloc(this.userRepository, this.chatBloc, this.userBloc)
      : super(const SearchUsersState.initial()) {
    on<_QueryChanged>((event, emit) async {
      final query = event.query;

      if (query.isNotEmpty) {
        emit(const SearchUsersState.loadingResults());
        final searchResult = await userRepository.searchUsers(query: query);
        await searchResult.fold((failure) {
          emit(const SearchUsersState.loadingFailure());
        }, (users) async {
          emit(SearchUsersState.loadingSuccessful(
              (await _markAlreadyExistingChats(await _removeCurrentUser(users)))
                  .toImmutableList()));
        });
      } else {
        emit(const SearchUsersState.loadingSuccessful(KtList.empty()));
      }
    });
  }

  bool _hasChatWith(UserEntity user, List<ChatEntity> chats) {
    final uid = user.uid;

    for (var chat in chats) {
      if (chat.contact.uid == uid) {
        return true;
      }
    }
    return false;
  }

  Future<List<SearchResult>> _markAlreadyExistingChats(
      List<UserEntity> searchResult) async {
    final chats = await chatBloc.getChats();
    final results = searchResult
        .map((e) => SearchResult(
            chatAlreadyExists: _hasChatWith(e, chats.asList()), user: e))
        .toList();
    return results;
  }

  Future<List<UserEntity>> _removeCurrentUser(List<UserEntity> users) async {
    final uid = (await userBloc.getCurrentUser()).uid;
    users.removeWhere((user) => user.uid == uid);
    return users;
  }
}
