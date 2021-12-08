import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_users_event.dart';
part 'search_users_state.dart';
part 'search_users_bloc.freezed.dart';

class SearchUsersBloc extends Bloc<SearchUsersEvent, SearchUsersState> {
  SearchUsersBloc() : super(_Initial()) {
    on<SearchUsersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
