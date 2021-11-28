import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:telleo/application/blocs/auth/auth_bloc.dart';
import 'package:telleo/domain/core/repositories/user_repository.dart';
import 'package:telleo/domain/states/user_state.dart';

import '../../../helpers/data_sets.dart';
import 'auth_bloc_test.mocks.dart';

@GenerateMocks([UserRepository, UserState])
void main() {
  group('AuthBloc', () {
    late AuthBloc sut;
    late MockUserRepository userRepository;
    late MockUserState userState;
    setUp(() {
      userRepository = MockUserRepository();
      userState = MockUserState();
      sut = AuthBloc(userRepository, userState);
    });

    tearDown(() {
      sut.close();
    });

    group('RequestUserCheck', () {
      test(
          'it should call userRepository.getCurrentUser and when a user is returned it should update the userState and emit an Authenticated event',
          () async {
        when(userRepository.getCurrentUser())
            .thenAnswer((_) => Future.value(some(testUser)));
        when(userState.update(any)).thenAnswer((_) {});
        sut.add(const RequestUserCheck());
        expectLater(sut.stream, emits(const AuthState.authenticated()));

        await untilCalled(userRepository.getCurrentUser());
        await untilCalled(userState.update(any));

        verifyInOrder(
            [userRepository.getCurrentUser(), userState.update(testUser)]);
        verifyNoMoreInteractions(userRepository);
        verifyNoMoreInteractions(userState);
      });

      test(
          'it should call userRepository.getCurrentUser and when nothing is returned it should update the userState with null and emit an Unauthenticated event',
          () async {
        when(userRepository.getCurrentUser())
            .thenAnswer((_) => Future.value(none()));
        when(userState.update(any)).thenAnswer((_) {});

        sut.add(const RequestUserCheck());
        expectLater(sut.stream, emits(const AuthState.unauthenticated()));

        await untilCalled(userRepository.getCurrentUser());
        await untilCalled(userState.update(any));

        verifyInOrder(
            [userRepository.getCurrentUser(), userState.update(null)]);
        verifyNoMoreInteractions(userRepository);
        verifyNoMoreInteractions(userState);
      });
    });

    group('SignOut', () {
      test(
          'it should set the current user to null and emit an unauthenticated event',
          () async {
        when(userState.update(any)).thenAnswer((_) {});
        sut.add(const SignOut());
        expectLater(sut.stream, emits(const Unauthenticated()));

        await untilCalled(userState.update(any));
        verify(userState.update(null));

        verifyNoMoreInteractions(userState);
      });
    });
  });
}
