import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/application/blocs/app/bloc/app_bloc.dart';
import 'package:telleo/domain/core/async_value.dart';
import 'package:telleo/domain/core/dartz_option_ext.dart';
import 'package:telleo/domain/user/user_entity.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final AppBloc appBloc;
  HomePageBloc(this.appBloc)
      : super(HomePageState.initial(
          user: appBloc.state.user.map(
            data: (data) => AsyncValue.data(
              data.data.getOrCrash(),
            ),
            loading: (l) => const AsyncValue.loading(),
            error: (err) => AsyncValue.error(err.message),
          ),
        )) {
    on<_StartedSearching>((event, emit) {
      emit(state.copyWith(isSearching: true));
    });
    on<_StoppedSearching>((event, emit) {
      emit(state.copyWith(isSearching: false));
    });
  }
}
