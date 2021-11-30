import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:telleo/application/blocs/app/bloc/app_bloc.dart';

import 'package:telleo/application/blocs/home/chats_page/chats_page_bloc.dart';
import 'package:telleo/domain/chats/chat_entity.dart';

import '../../../../helpers/data_sets.dart';

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

void main() {
  group('ChatsPageBloc', () {
    late ChatsPageBloc sut;
    late MockAppBloc appBloc;

    setUp(() {
      appBloc = MockAppBloc();
      sut = ChatsPageBloc(appBloc);
    });

    test('initial state should be [expectedInitial]', () {
      const expectedInitial = ChatsPageState(chats: [], loading: true);

      expect(sut.state, expectedInitial);
    });

    //blocTest(description, build: build)

    final updatedChats = [...testChats, ...testChats];
    blocTest<ChatsPageBloc, ChatsPageState>(
      'when AppBloc emits an event that contains a new list of chats, it should set loading to true, take the passed chats and use them to update the current state and set to loading to false again',
      build: () => sut,
      act: (bloc) {
        bloc.appBloc
            .emit(AppState.initial().copyWith(chats: some(updatedChats)));
      },
      expect: () => [
        ChatsPageState.initial().copyWith(chats: updatedChats, loading: false),
      ],
    );

    test(
        'when AppBloc emits an event that contains a new list of chats, it should set loading to true, take the passed chats and use them to update the current state and set to loading to false again',
        () {
      expectLater(
        sut.stream,
        emitsInOrder(
          [
            ChatsPageState.initial().copyWith(loading: true),
            ChatsPageState.initial().copyWith(chats: updatedChats),
            ChatsPageState.initial()
                .copyWith(chats: updatedChats, loading: false),
          ],
        ),
      );

      appBloc.emit(AppState.initial().copyWith(chats: some(updatedChats)));

      //appBloc.add(AppEvent.updateChats(chats: some(updatedChats)));
    });

    test(
        'when AppBloc emits an event that contains a the already present list of chats, it should do nothing',
        () {
      final updatedChats = none<List<ChatEntity>>();
      expectLater(
        sut.stream,
        emitsInOrder([]),
      );
      appBloc.add(AppEvent.updateChats(chats: updatedChats));
    });
  });
}
