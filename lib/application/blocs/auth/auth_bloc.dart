import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/user/user_repository.dart';
import '../../../domain/states/user_state.dart';

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
      userResult.fold((failure) {
        failure.map(
          serverError: (_) {
            emit(const AuthState.error(message: 'Internal server error'));
          },
          noConnection: (_) {
            emit(
                const AuthState.error(message: 'Please check your connection'));
          },
          invalidAccessToken: (_) {
            //todo: request new accessToken
          },
        );
      }, (a) {
        a.fold(() {
          userState.update(null);
          emit(const AuthState.unauthenticated());
        }, (a) {
          userState.update(a);
          emit(const AuthState.authenticated());
        });
      });
    });
    on<SignOut>((event, emit) {
      userState.update(null);
      emit(const AuthState.unauthenticated());
    });
  }
}
