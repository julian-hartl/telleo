import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/domain/core/async_value.dart';
import 'package:telleo/domain/user/user_entity.dart';
import 'package:telleo/domain/user/user_repository.dart';

part 'search_users_event.dart';
part 'search_users_state.dart';
part 'search_users_bloc.freezed.dart';

@lazySingleton
class SearchUsersBloc extends Bloc<SearchUsersEvent, SearchUsersState> {
  final UserRepository userRepository;
  SearchUsersBloc(this.userRepository) : super(SearchUsersState.initial()) {
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
          emit(state.copyWith(users: AsyncValue.data(users)));
        });
      }
    });
  }
}
