import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/domain/core/services/logger.dart';
import 'package:telleo/domain/user/user_entity.dart';
import 'package:telleo/domain/user/user_failures.dart';
import 'package:telleo/domain/user/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

@lazySingleton
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final ILogger log;

  Future<UserEntity> getCurrentUser() async {
    if (state is _LoadingSuccess) {
      return (state as _LoadingSuccess).user;
    }
    Future.delayed(const Duration(seconds: 10),
        () => throw ErrorHint('Getting user timeout.'));
    log.logWarning('Accessing current user when it is not loaded yet.');
    final Completer<UserEntity> completer = Completer();
    StreamSubscription? sub;
    sub = stream.listen((state) {
      if (state is _LoadingSuccess) {
        sub?.cancel();
        completer.complete(state.user);
      }
    });
    return completer.future;
  }

  UserBloc(this.userRepository, this.log) : super(const UserState.initial()) {
    on<_UpdateUser>((event, emit) async {
      final user = event.user;
      emit(UserState.loadingSuccess(user));
    });

    on<_LoadUser>((event, emit) async {
      log.logInfo('Loading user');
      final currentUserResult = await userRepository.getCurrentUser();
      currentUserResult.fold(
        (failure) => emit(UserState.loadingFailure(failure)),
        (user) => emit(UserState.loadingSuccess(user)),
      );
    });
  }
}
