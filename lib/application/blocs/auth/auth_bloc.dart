import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/core/async_value.dart';
import '../../../domain/user/user_repository.dart';
import '../../../domain/user/user_state.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  final UserState userState;

  AuthBloc(this.userRepository, this.userState) : super(const _Loading()) {
    userState.addListener((asyncUser) {
      add(const _RequestUserCheck());
    });
    on<_RequestUserCheck>((event, emit) async {
      userState.value.map(
        data: (userValue) {
          final user = userValue.data;
          user.fold(() => emit(const _Unauthenticated()),
              (a) => emit(const _Authenticated()));
        },
        loading: (_) => emit(const _Loading()),
        error: (err) => emit(
          AuthState.error(message: err.message),
        ),
      );
    });
    on<_SignOut>((event, emit) {
      userState.update(AsyncValue.data(none()));
      emit(const AuthState.unauthenticated());
    });
  }
}
