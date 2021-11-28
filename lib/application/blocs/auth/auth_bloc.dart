import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/domain/core/repositories/user_repository.dart';
import 'package:telleo/domain/states/user_state.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  final UserState userState;

  AuthBloc(this.userRepository, this.userState) : super(const _Initial()) {
    on<RequestUserCheck>((event, emit) async {
      final userResult = await userRepository.getCurrentUser();
      userResult.fold(() {
        userState.update(null);
        emit(const AuthState.unauthenticated());
      }, (a) {
        userState.update(a);
        emit(const AuthState.authenticated());
      });
    });
    on<SignOut>((event, emit) {
      userState.update(null);
      emit(const AuthState.unauthenticated());
    });
  }
}
