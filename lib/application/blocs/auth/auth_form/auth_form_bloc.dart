import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/auth/auth_failure.dart';
import '../../../../domain/auth/auth_repository.dart';
import '../../../../domain/auth/value_objects.dart';

part 'auth_form_bloc.freezed.dart';
part 'auth_form_event.dart';
part 'auth_form_state.dart';

class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  final AuthRepository authRepository;

  Future<void> _performAuthAction(
      Emitter<AuthFormState> emit,
      Future<Either<AuthFailure, Unit>> Function(String email, String password)
          authAction) async {
    emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccess: none(),
        showErrorMessages: false));
    final isEmailValid = state.emailAdress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      final email = state.emailAdress.value.getOrElse(() => '');
      final password = state.password.value.getOrElse(() => '');
      final authResult = await authAction(email, password);

      emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccess: some(authResult),
          showErrorMessages: authResult.isLeft()));
    } else {
      emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccess: none()));
    }
  }

  AuthFormBloc(this.authRepository, [AuthFormState? initial])
      : super(initial ?? AuthFormState.initial()) {
    on<AuthPasswordChanged>((event, emit) {
      final updated = state.copyWith(password: Password(event.password));
      emit(updated);
    });
    on<AuthEmailChanged>((event, emit) {
      emit(state.copyWith(emailAdress: EmailAdress(event.email)));
    });
    on<AuthSignIn>((event, emit) async {
      _performAuthAction(
          emit,
          (email, password) => authRepository.signInWithEmailAndPassword(
              email: email, password: password));
    });
    on<AuthSignUp>((event, emit) async {
      _performAuthAction(
          emit,
          (email, password) => authRepository.signUpWithEmailAndPassword(
              email: email, password: password));
    });
    on<AuthSignInWithGoogle>((event, emit) async {
      emit(state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: none(),
          showErrorMessages: false));
      final authResult = await authRepository.signInWithGoogle();
      emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccess: some(authResult),
          showErrorMessages: authResult.isLeft()));
    });
  }
}
