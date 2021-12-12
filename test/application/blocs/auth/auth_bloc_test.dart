import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:telleo/application/blocs/auth/auth_bloc.dart';
import 'package:telleo/domain/errors.dart';
import 'package:telleo/domain/user/user_failures.dart';
import 'package:telleo/domain/user/user_repository.dart';
import 'package:telleo/domain/user/user_state.dart';
import 'package:telleo/utils/dependencies.dart';

import '../../../helpers/data_sets.dart';


/*

@GenerateMocks([UserRepository, AppBloc])
void main() {
  group('AuthBloc', () {
    late AuthBloc sut;
    late MockUserRepository userRepository;
    late MockAppBloc appBloc;
    setUp(() {
      userRepository = MockUserRepository();
      appBloc = MockAppBloc();
      sut = AuthBloc(userRepository, appBloc);
    });

    tearDown(() {
      sut.close();
    });

    group('RequestUserCheck', () {
      test(
          'it should get the currentUser from the userRepository and add an userupdate event to the appBloc',
          () async {
        final answer = some(testUser);
        when(userRepository.getCurrentUser())
            .thenAnswer((_) => Future.value(right(answer)));
        when(appBloc.add(any)).thenAnswer((_) {
          appBloc.emit(AppState.initial().copyWith(user: answer));
        });
        sut.add(const AuthEvent.requestUserCheck());
        expectLater(sut.stream, emits(const AuthState.authenticated()));

        await untilCalled(userRepository.getCurrentUser());
        await untilCalled(appBloc.add(any));

        verifyInOrder([
          userRepository.getCurrentUser(),
          appBloc.add(AppEvent.updateUser(user: answer))
        ]);
        verifyNoMoreInteractions(userRepository);
        verifyNoMoreInteractions(appBloc);
      });

      test(
          'it should call userRepository.getCurrentUser and when nothing is returned it should update the userState with none and emit an Unauthenticated event',
          () async {
        when(userRepository.getCurrentUser())
            .thenAnswer((_) => Future.value(right(none())));
        when(userState.update(any)).thenAnswer((_) {});

        sut.add(const AuthEvent.requestUserCheck());
        expectLater(sut.stream, emits(const AuthState.unauthenticated()));

        await untilCalled(userRepository.getCurrentUser());
        await untilCalled(userState.update(any));

        verifyInOrder(
            [userRepository.getCurrentUser(), userState.update(none())]);
        verifyNoMoreInteractions(userRepository);
        verifyNoMoreInteractions(userState);
      });

      test(
          'it should call userRepository.getCurrentUser and when UserFailure.serverError is returned it should emit an AuthError with message ErrorMessage.internalServerError',
          () async {
        when(userRepository.getCurrentUser()).thenAnswer(
            (_) => Future.value(left(const UserFailure.serverError())));

        sut.add(const AuthEvent.requestUserCheck());
        expectLater(
            sut.stream,
            emits(const AuthState.error(
                message: ErrorMessage.internalServerError)));

        await untilCalled(userRepository.getCurrentUser());
        verify(userRepository.getCurrentUser());
        verifyNoMoreInteractions(userRepository);
        verifyZeroInteractions(userState);
      });

      test(
          'it should call userRepository.getCurrentUser and when UserFailure.noConnection is returned it should emit an AuthError with message ErrorMessage.connectionError',
          () async {
        when(userRepository.getCurrentUser()).thenAnswer(
            (_) => Future.value(left(const UserFailure.noConnection())));

        sut.add(const AuthEvent.requestUserCheck());
        expectLater(
          sut.stream,
          emits(
            const AuthState.error(message: ErrorMessage.connectionError),
          ),
        );

        await untilCalled(userRepository.getCurrentUser());
        verify(userRepository.getCurrentUser());
        verifyNoMoreInteractions(userRepository);
        verifyZeroInteractions(userState);
      });
    });

    group('SignOut', () {
      test(
          'it should set the current user to none and emit an unauthenticated event',
          () async {
        when(userState.update(any)).thenAnswer((_) {});
        sut.add(const AuthEvent.signOut());
        expectLater(sut.stream, emits(const AuthState.unauthenticated()));

        await untilCalled(userState.update(any));
        verify(userState.update(none()));

        verifyNoMoreInteractions(userState);
      });
    });
  });
}

*/
