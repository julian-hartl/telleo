import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:telleo/application/blocs/auth/auth_form/auth_form_bloc.dart';

import 'package:telleo/domain/auth/auth_failure.dart';
import 'package:telleo/domain/auth/auth_repository.dart';
import 'package:telleo/domain/core/value_objects.dart';

import 'auth_form_bloc_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  group('AuthFormBloc', () {
    late AuthFormBloc bloc;
    late MockAuthRepository authRepository;
    setUp(() {
      authRepository = MockAuthRepository();
      bloc = AuthFormBloc(authRepository);
    });
    final AuthFormState initialState = AuthFormState(
      obscurePassword: false,
      emailAdress: EmailAdress(''),
      password: Password(''),
      isSubmitting: false,
      authFailureOrSuccess: none(),
      showErrorMessages: false,
    );
    test('initial state should be as constructed as in the test', () {
      expect(bloc.state, equals(initialState));
    });

    tearDown(() async {
      await bloc.close();
    });
    group('PasswordChanged', () {
      test(
          'When PasswordChanged is emitted password should contain the password (can be in the failure)',
          () async {
        const password = 'hello';

        expectLater(
            bloc.stream,
            emits(AuthFormState.initial()
                .copyWith(password: Password(password))));
        bloc.add(const AuthFormEvent.passwordChanged(password));
      });
    });

    group('EmailChanged', () {
      test(
          'When EmailChanged is emitted email should contain the email (can be in the failure)',
          () async {
        const email = 'ze@songij.fr';

        expectLater(
            bloc.stream,
            emits(AuthFormState.initial()
                .copyWith(emailAdress: EmailAdress(email))));
        bloc.add(const AuthFormEvent.emailChanged(email));
      });
    });

    group('SignIn', () {
      test(
          'When SignIn is emitted and both the password and the email are valid authRepository.signInWithEmailAndPassword should be called, when that returns a unit signin was successful',
          () async {
        final email = EmailAdress('ze@songij.fr');
        final password = Password('URQfGnKkpfoaonssbaUq');
        final initial = AuthFormState.initial()
            .copyWith(password: password, emailAdress: email);
        bloc = AuthFormBloc(authRepository, initial);

        when(authRepository.signInWithEmailAndPassword(
                email: anyNamed('email'), password: anyNamed('password')))
            .thenAnswer((_) async => right(unit));

        expectLater(
            bloc.stream,
            emitsInOrder([
              initial.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: true,
                showErrorMessages: false,
              ),
              initial.copyWith(
                authFailureOrSuccess: some(right(unit)),
                isSubmitting: false,
                showErrorMessages: false,
              ),
            ]));
        bloc.add(const AuthFormEvent.signIn());
        await untilCalled(authRepository.signInWithEmailAndPassword(
            email: anyNamed('email'), password: anyNamed('password')));
        verify(authRepository.signInWithEmailAndPassword(
                email: email, password: password))
            .called(1);
      });

      test(
          'When SignIn is emitted and either the password or the email are invalid authRepository.signInWithEmailAndPassword should not be called',
          () async {
        final email = EmailAdress('zesongij.fr');
        final password = Password('URQf');
        final initial = AuthFormState.initial()
            .copyWith(password: password, emailAdress: email);
        bloc = AuthFormBloc(authRepository, initial);

        when(authRepository.signInWithEmailAndPassword(
                email: anyNamed('email'), password: anyNamed('password')))
            .thenAnswer((_) async => right(unit));

        expectLater(
            bloc.stream,
            emitsInOrder([
              initial.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: true,
                showErrorMessages: false,
              ),
              initial.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: false,
                showErrorMessages: true,
              ),
            ]));
        bloc.add(const AuthFormEvent.signIn());
        verifyNever(authRepository.signInWithEmailAndPassword(
            email: email, password: password));
      });

      test(
          'When SignIn is emitted and both the password and the email are valid authRepository.signInWithEmailAndPassword should be called, when that returns an auth failure signin was not successful',
          () async {
        final email = EmailAdress('ze@songij.fr');
        final password = Password('URQfGnKkpfoaonssbaUq');
        final initial = AuthFormState.initial()
            .copyWith(password: password, emailAdress: email);
        bloc = AuthFormBloc(authRepository, initial);
        const authFailure = AuthFailure.cancelledByUser();

        when(authRepository.signInWithEmailAndPassword(
                email: anyNamed('email'), password: anyNamed('password')))
            .thenAnswer((_) async => left(authFailure));

        expectLater(
            bloc.stream,
            emitsInOrder([
              initial.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: true,
                showErrorMessages: false,
              ),
              initial.copyWith(
                authFailureOrSuccess: some(left(authFailure)),
                isSubmitting: false,
                showErrorMessages: true,
              ),
            ]));
        bloc.add(const AuthFormEvent.signIn());
        await untilCalled(authRepository.signInWithEmailAndPassword(
            email: anyNamed('email'), password: anyNamed('password')));
        verify(authRepository.signInWithEmailAndPassword(
                email: email, password: password))
            .called(1);
      });
    });

    group('SignUp', () {
      test(
          'When SignUp is emitted and both the password and the email are valid authRepository.signUpWithEmailAndPassword should be called, when that returns a unit signin was successful',
          () async {
        final email = EmailAdress('ze@songij.fr');
        final password = Password('URQfGnKkpfoaonssbaUq');
        final initial = AuthFormState.initial()
            .copyWith(password: password, emailAdress: email);
        bloc = AuthFormBloc(authRepository, initial);

        when(authRepository.signUpWithEmailAndPassword(
                email: anyNamed('email'), password: anyNamed('password')))
            .thenAnswer((_) async => right(unit));

        expectLater(
            bloc.stream,
            emitsInOrder([
              initial.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: true,
                showErrorMessages: false,
              ),
              initial.copyWith(
                authFailureOrSuccess: some(right(unit)),
                isSubmitting: false,
                showErrorMessages: false,
              ),
            ]));
        bloc.add(const AuthFormEvent.signUp());
        await untilCalled(authRepository.signUpWithEmailAndPassword(
            email: anyNamed('email'), password: anyNamed('password')));
        verify(authRepository.signUpWithEmailAndPassword(
                email: email, password: password))
            .called(1);
      });

      test(
          'When SignUp is emitted and either the password or the email are invalid authRepository.signUpWithEmailAndPassword should not be called',
          () async {
        final email = EmailAdress('zesongij.fr');
        final password = Password('URQf');
        final initial = AuthFormState.initial()
            .copyWith(password: password, emailAdress: email);
        bloc = AuthFormBloc(authRepository, initial);

        when(authRepository.signUpWithEmailAndPassword(
                email: anyNamed('email'), password: anyNamed('password')))
            .thenAnswer((_) async => right(unit));

        expectLater(
            bloc.stream,
            emitsInOrder([
              initial.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: true,
                showErrorMessages: false,
              ),
              initial.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: false,
                showErrorMessages: true,
              ),
            ]));
        bloc.add(const AuthFormEvent.signUp());
        verifyNever(authRepository.signUpWithEmailAndPassword(
            email: email, password: password));
      });

      test(
          'When SignUp is emitted and both the password and the email are valid authRepository.signUpWithEmailAndPassword should be called, when that returns an auth failure SignUp was not successful',
          () async {
        final email = EmailAdress('ze@songij.fr');
        final password = Password('URQfGnKkpfoaonssbaUq');
        final initial = AuthFormState.initial()
            .copyWith(password: password, emailAdress: email);
        bloc = AuthFormBloc(authRepository, initial);
        const authFailure = AuthFailure.cancelledByUser();

        when(authRepository.signUpWithEmailAndPassword(
                email: anyNamed('email'), password: anyNamed('password')))
            .thenAnswer((_) async => left(authFailure));

        expectLater(
            bloc.stream,
            emitsInOrder([
              initial.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: true,
                showErrorMessages: false,
              ),
              initial.copyWith(
                authFailureOrSuccess: some(left(authFailure)),
                isSubmitting: false,
                showErrorMessages: true,
              ),
            ]));
        bloc.add(const AuthFormEvent.signUp());
        await untilCalled(authRepository.signUpWithEmailAndPassword(
            email: anyNamed('email'), password: anyNamed('password')));
        verify(authRepository.signUpWithEmailAndPassword(
                email: email, password: password))
            .called(1);
      });
    });

    group('SignInWithGoogle', () {
      test(
          'When SignInGoogle is called authRepository.signInWithGoogle should be called, when that returns a unit signin was successful',
          () async {
        when(authRepository.signInWithGoogle())
            .thenAnswer((_) async => right(unit));

        expectLater(
            bloc.stream,
            emitsInOrder([
              initialState.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: true,
                showErrorMessages: false,
              ),
              initialState.copyWith(
                authFailureOrSuccess: some(right(unit)),
                isSubmitting: false,
                showErrorMessages: false,
              ),
            ]));
        bloc.add(const AuthFormEvent.signInWithGoogle());
        await untilCalled(authRepository.signInWithGoogle());
        verify(authRepository.signInWithGoogle()).called(1);
      });

      test(
          'When SignInWithGoogle is emitted authRepository.signInWithGoogle should be called, when that returns an auth failure SignUp was not successful',
          () async {
        final initial = initialState;
        const authFailure = AuthFailure.cancelledByUser();

        when(authRepository.signInWithGoogle())
            .thenAnswer((_) async => left(authFailure));

        expectLater(
            bloc.stream,
            emitsInOrder([
              initial.copyWith(
                authFailureOrSuccess: none(),
                isSubmitting: true,
                showErrorMessages: false,
              ),
              initial.copyWith(
                authFailureOrSuccess: some(left(authFailure)),
                isSubmitting: false,
                showErrorMessages: true,
              ),
            ]));
        bloc.add(const AuthFormEvent.signInWithGoogle());
        await untilCalled(authRepository.signInWithGoogle());
        verify(authRepository.signInWithGoogle()).called(1);
      });
    });
  });
}
