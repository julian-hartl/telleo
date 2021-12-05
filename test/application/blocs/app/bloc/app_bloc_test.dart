import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:telleo/application/blocs/app/bloc/app_bloc.dart';
import 'package:telleo/domain/chats/chats_repository.dart';
import 'package:telleo/domain/chats/chats_state.dart';
import 'package:telleo/domain/core/async_value.dart';
import 'package:telleo/domain/user/user_repository.dart';
import 'package:telleo/domain/user/user_state.dart';

import '../../../../helpers/data_sets.dart';
import 'app_bloc_test.mocks.dart';

@GenerateMocks([UserState, ChatsState, UserRepository, ChatsRepository])
void main() {
  group('AppBloc', () {
    late AppBloc sut;
    late MockUserState userState;
    late MockChatsState chatsState;
    late MockUserRepository userRepository;
    late MockChatsRepository chatsRepository;

    setUp(() {
      userState = MockUserState();
      chatsState = MockChatsState();
      userRepository = MockUserRepository();
      chatsRepository = MockChatsRepository();
      sut = AppBloc(userState, chatsState, userRepository, chatsRepository);
    });

    test('initial state should be as shown in body', () {
      final expectedInitial = AppState(
          user: const AsyncValue.loading(), chats: const AsyncValue.loading());

      expect(sut.state, expectedInitial);
    });

    group('UpdateUser', () {
      test(
        'when there is no user passed in the event it should get the currentUser from the userRepo and it should update the userState and also update its own state to contain the passed user and then emit the new state',
        () async {
          when(userState.update(any)).thenAnswer((_) {});
          when(userRepository.getCurrentUser())
              .thenAnswer((_) => Future.value(right(some(testUser))));

          expectLater(
            sut.stream,
            emitsInOrder(
              [
                sut.state.copyWith(user: const AsyncValue.loading()),
                sut.state.copyWith(user: AsyncValue.data(some(testUser))),
              ],
            ),
          );
          sut.add(const AppEvent.updateUser());
          await untilCalled(userRepository.getCurrentUser());
          await untilCalled(userState.update(any));
          verify(userState.update(AsyncValue.data(some(testUser))));
          verify(userRepository.getCurrentUser());
          verifyNoMoreInteractions(userState);
          verifyNoMoreInteractions(userRepository);
          verifyZeroInteractions(chatsState);
          verifyZeroInteractions(chatsRepository);
        },
      );

      test(
        'when there is an user passed in the event it should not get the currentUser from the userRepo and it should update the userState and also update its own state to contain the passed user and then emit the new state',
        () async {
          when(userState.update(any)).thenAnswer((_) {});
          when(userRepository.getCurrentUser())
              .thenAnswer((_) => Future.value(right(some(testUser))));

          expectLater(
            sut.stream,
            emitsInOrder(
              [
                sut.state.copyWith(user: const AsyncValue.loading()),
                sut.state.copyWith(user: AsyncValue.data(some(testUser))),
              ],
            ),
          );
          sut.add(AppEvent.updateUser(user: AsyncValue.data(some(testUser))));

          await untilCalled(userState.update(any));
          verify(userState.update(AsyncValue.data(some(testUser))));

          verifyNoMoreInteractions(userState);
          verifyZeroInteractions(userRepository);
          verifyZeroInteractions(chatsState);
          verifyZeroInteractions(chatsRepository);
        },
      );
    });

    group('UpdateChats', () {
      test(
        'when there is no chats passed it should call chatsRepository and it should update the chatsState and also update its own state to contain the passed chats and then emit the new state',
        () async {
          when(chatsState.update(any)).thenAnswer((_) {});
          when(chatsRepository.getChats())
              .thenAnswer((_) => Future.value(right(testChats)));

          expectLater(
            sut.stream,
            emitsInOrder(
              [
                sut.state.copyWith(user: const AsyncValue.loading()),
                sut.state.copyWith(chats: AsyncValue.data(testChats)),
              ],
            ),
          );
          sut.add(const AppEvent.updateChats());
          await untilCalled(chatsRepository.getChats());
          await untilCalled(chatsState.update(any));
          verify(chatsState.update(AsyncValue.data(testChats)));
          verify(chatsRepository.getChats());
          verifyNoMoreInteractions(chatsState);
          verifyZeroInteractions(userState);
          verifyZeroInteractions(userRepository);
        },
      );

      test(
        'when there is some chats passed it should not call chatsRepository and it should update the chatsState and also update its own state to contain the passed chats and then emit the new state',
        () async {
          when(chatsState.update(any)).thenAnswer((_) {});
          when(chatsRepository.getChats())
              .thenAnswer((_) => Future.value(right(testChats)));

          expectLater(
            sut.stream,
            emitsInOrder(
              [
                sut.state.copyWith(user: const AsyncValue.loading()),
                sut.state.copyWith(chats: AsyncValue.data(testChats)),
              ],
            ),
          );
          sut.add(AppEvent.updateChats(chats: AsyncValue.data(testChats)));
          await untilCalled(chatsState.update(any));
          verify(chatsState.update(AsyncValue.data(testChats)));
          verifyNoMoreInteractions(chatsState);
          verifyZeroInteractions(userState);
          verifyZeroInteractions(chatsRepository);
          verifyZeroInteractions(userRepository);
        },
      );
    });
  });
}
