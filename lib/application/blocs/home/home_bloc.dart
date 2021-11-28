import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import '../../../domain/auth/auth_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeIncrement>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });
    on<HomeDecrement>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }
}
