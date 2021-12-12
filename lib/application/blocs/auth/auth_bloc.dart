import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/services/token_service/token_refresh_service.dart';
import '../../../domain/core/services/token_service/token_service.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenService tokenService;
  final RefreshTokenService refreshTokenService;
  static const accessTokenExpiryDuration = Duration(minutes: 15);

  AuthBloc(this.tokenService, this.refreshTokenService)
      : super(const _Loading()) {
    on<_SignIn>((event, emit) async {
      await _signIn(emit);
    });
    on<_SignOut>((event, emit) {
      emit(const AuthState.unauthenticated());
    });
  }

  void _scheduleNextAccessTokenRefresh() {
    // TODO: add some extra validation so that it is only refresh when the current refresh token is not null
    Future.delayed(accessTokenExpiryDuration, () async {
      await refreshTokenService.refreshAccessToken();
      _scheduleNextAccessTokenRefresh();
    });
  }

  Future<void> _signIn(Emitter emit) async {
    final refreshToken = await tokenService.getRefreshToken();
    if (refreshToken != null) {
      final validRefreshToken =
          await refreshTokenService.validateRefreshToken();
      if (validRefreshToken) {
        await refreshTokenService.refreshAccessToken();
        final accessToken = await tokenService.getAccessToken();
        if (accessToken != null) {
          _scheduleNextAccessTokenRefresh();

          emit(const AuthState.authenticated());
        } else {
          emit(const AuthState.unauthenticated());
        }
      }
    } else {
      emit(const AuthState.unauthenticated());
    }
  }
}
