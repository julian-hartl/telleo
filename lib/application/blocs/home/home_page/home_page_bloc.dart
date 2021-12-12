import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_page_bloc.freezed.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

@lazySingleton
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState.initial()) {
    on<_StartedSearching>((event, emit) {
      emit(const HomePageState.search());
    });
    on<_StoppedSearching>((event, emit) {
      emit(const HomePageState.chats());
    });
  }
}
