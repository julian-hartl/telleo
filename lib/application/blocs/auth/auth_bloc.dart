import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/core/services/logger.dart';
import '../../../domain/core/services/token_service/token_refresh_service.dart';
import '../../../domain/core/services/token_service/token_service.dart';
import '../../../domain/user/user_repository.dart';
import '../../../utils/dependencies.dart';
import '../../../domain/core/async_value.dart';

import '../../../domain/user/user_entity.dart';
import '../app/bloc/app_bloc.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenService tokenService;
  final TokenRefreshService tokenRefreshService;
  final AppBloc appBloc;
  final UserRepository userRepository;

  static const accessTokenExpiryDuration = Duration(minutes: 1);

  AuthBloc(this.appBloc, this.tokenService, this.userRepository,
      this.tokenRefreshService)
      : super(const _Loading()) {
    on<_SignIn>((event, emit) async {
      await _signIn(emit);
    });
    on<_SignOut>((event, emit) {
      appBloc.add(AppEvent.updateUser(user: AsyncValue.data(none())));
      emit(const AuthState.unauthenticated());
    });
  }

  void _scheduleNextAccessTokenRefresh() {
    // TODO: add some extra validation so that it is only refresh when the current refresh token is not null
    Future.delayed(accessTokenExpiryDuration, () async {
      await tokenRefreshService.refreshAccessToken();
      _scheduleNextAccessTokenRefresh();
    });
  }

  Future<void> _signIn(Emitter emit) async {
    final refreshToken = await tokenService.getRefreshToken();
    if (refreshToken != null) {
      await tokenRefreshService.refreshAccessToken();
      final accessToken = await tokenService.getAccessToken();
      if (accessToken != null) {
        _scheduleNextAccessTokenRefresh();

        final userResult = await userRepository.getCurrentUser();
        app.get<ILogger>().logInfo(userResult.toString());
        userResult.fold((failure) {
          appBloc.add(
            AppEvent.updateUser(
              user: AsyncValue.error(
                failure.map(
                    serverError: (_) => 'Server error occurred.',
                    noConnection: (_) => 'Please check your connection.'),
              ),
            ),
          );
          emit(const AuthState.unauthenticated());
        }, (userOption) {
          userOption.fold(() {
            appBloc.add(AppEvent.updateUser(user: AsyncValue.data(none())));
            emit(const AuthState.unauthenticated());
          }, (user) {
            appBloc.add(AppEvent.updateUser(user: AsyncValue.data(some(user))));
            emit(const AuthState.authenticated());
          });
        });
      }
    }
  }
}
