import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/domain/core/services/logger.dart';
import 'package:telleo/utils/dependencies.dart';
import '../../../domain/core/async_value.dart';

import '../../../domain/user/user_entity.dart';
import '../app/bloc/app_bloc.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppBloc appBloc;
  @visibleForTesting
  late final StreamSubscription<AppState> appStateStream;

  AuthBloc(this.appBloc) : super(const _Loading()) {
    appStateStream = appBloc.stream.listen((event) {
      event.user.map(
        data: (data) {
          add(_RequestUserCheck(user: data.data));
        },
        loading: (_) {},
        error: (_) => add(
          _RequestUserCheck(
            user: none(),
          ),
        ),
      );
    });
    appBloc.add(const AppEvent.updateUser());
    on<_RequestUserCheck>((event, emit) async {
      final user = event.user;

      user.fold(() => emit(const AuthState.unauthenticated()),
          (a) => emit(const AuthState.authenticated()));
    });
    on<_SignOut>((event, emit) {
      appBloc.add(AppEvent.updateUser(user: AsyncValue.data(none())));
      emit(const AuthState.unauthenticated());
    });
  }

  @override
  Future<void> close() {
    appStateStream.cancel();
    return super.close();
  }
}
