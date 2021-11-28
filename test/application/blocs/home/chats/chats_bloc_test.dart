import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:telleo/application/blocs/home/chats/chats_bloc.dart';
import 'package:telleo/domain/chats/chats_failures.dart';
import 'package:telleo/domain/chats/chats_repository.dart';
import 'package:telleo/domain/states/chats_data_state.dart';

import '../../../../helpers/data_sets.dart';
import 'chats_bloc_test.mocks.dart';

@GenerateMocks([ChatsRepository, ChatsDataState])
void main() {
  group('ChatsBloc', () {
    late ChatsBloc sut;
    late MockChatsRepository chatsRepository;
    late MockChatsDataState chatsState;

    setUp(() {
      chatsState = MockChatsDataState();
      chatsRepository = MockChatsRepository();
      sut = ChatsBloc(chatsState, chatsRepository);
    });

    group('RequestChats', () {
      test(
          'should set its state to loading and call chatsRepository.getChats and when that returns a list of chats it should update the chatsState accordingly and set its state to retrieved',
          () async {
        when(chatsRepository.getChats())
            .thenAnswer((_) => Future.value(right(chats)));
        when(chatsState.update(any)).thenAnswer((_) {});
        sut.add(const RequestChats());
        expectLater(
          sut.stream,
          emitsInOrder(
            [
              const ChatsState.loading(),
              const ChatsState.retrieved(),
            ],
          ),
        );
        await untilCalled(chatsRepository.getChats());
        await untilCalled(chatsState.update(any));

        verifyInOrder([chatsRepository.getChats(), chatsState.update(chats)]);
        verifyNoMoreInteractions(chatsRepository);
        verifyNoMoreInteractions(chatsState);
      });

      test(
          'should set its state to loading and call chatsRepository.getChats and when that returns a ChatsFailure.serverError it should not update the chatsState but set the state to error with message "Internal server error"',
          () async {
        when(chatsRepository.getChats()).thenAnswer(
            (_) => Future.value(left(const ChatsFailure.serverError())));
        when(chatsState.update(any)).thenAnswer((_) {});
        sut.add(const RequestChats());
        expectLater(
          sut.stream,
          emitsInOrder(
            [
              const ChatsState.loading(),
              const ChatsState.error(message: 'Internal server error'),
            ],
          ),
        );
        await untilCalled(chatsRepository.getChats());

        verify(chatsRepository.getChats());
        verifyNoMoreInteractions(chatsRepository);
        verifyZeroInteractions(chatsState);
      });

      test(
          'should set its state to loading and call chatsRepository.getChats and when that returns a ChatsFailure.noConnection it should not update the chatsState but set the state to error with message "Please check your connection"',
          () async {
        when(chatsRepository.getChats()).thenAnswer(
            (_) => Future.value(left(const ChatsFailure.noConnection())));
        when(chatsState.update(any)).thenAnswer((_) {});
        sut.add(const RequestChats());
        expectLater(
          sut.stream,
          emitsInOrder(
            [
              const ChatsState.loading(),
              const ChatsState.error(message: 'Please check your connection'),
            ],
          ),
        );
        await untilCalled(chatsRepository.getChats());

        verify(chatsRepository.getChats());
        verifyNoMoreInteractions(chatsRepository);
        verifyZeroInteractions(chatsState);
      });
    });
  });
}
