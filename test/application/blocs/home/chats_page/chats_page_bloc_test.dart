import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:telleo/application/blocs/app/bloc/app_bloc.dart';

import 'package:telleo/application/blocs/home/chats_page/chats_page_bloc.dart';
import 'package:telleo/domain/chats/chat_entity.dart';
import 'package:telleo/domain/core/async_value.dart';
import 'package:telleo/domain/core/dartz_option_ext.dart';
import 'package:telleo/domain/core/services/api_service/api_service.dart';

import '../../../../helpers/data_sets.dart';
import 'chats_page_bloc_test.mocks.dart';

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

@GenerateMocks([ApiService])
void main() {
  group('ChatsPageBloc', () {
    late ChatsPageBloc sut;
    late MockAppBloc appBloc;

    setUp(() {
      appBloc = MockAppBloc();
      sut = ChatsPageBloc(appBloc, MockApiService());
    });

    test('initial state should be [expectedInitial]', () {
      final expectedInitial = ChatsPageState(
        chats: const AsyncValue.loading(),
        user: appBloc.state.user.map(
          data: (data) => AsyncValue.data(
            data.data.getOrCrash(),
          ),
          loading: (l) => const AsyncValue.loading(),
          error: (err) => AsyncValue.error(err.message),
        ),
      );

      expect(sut.state, expectedInitial);
    });

    //blocTest(description, build: build)

/*
    final updatedChats = [...testChats, ...testChats];
    blocTest<ChatsPageBloc, ChatsPageState>(
      'when AppBloc emits an event that contains a new list of chats, it should take the passed chats and use them to update the current state',
      build: () => sut,
      act: (bloc) {
        bloc.appBloc.emit(
          AppState.initial().copyWith(
            chats: AsyncValue.data(updatedChats),
          ),
        );
      },
      expect: () => [
        ChatsPageState.initial().copyWith(
          chats: AsyncValue.data(updatedChats),
        ),
      ],
    );

    */

/*
    test(
        'when AppBloc emits an event that contains a new list of chats, it should take the passed chats and use them to update the current state',
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


    
    */

    /*
    blocTest<ChatsPageBloc, ChatsPageState>(
      'when Retry is added it should add updateChats to appBloc',
      build: () => sut,
      act: (bloc) => bloc.add(const ChatsPageEvent.retry(),),
      
    );
    */

    test(
        'when AppBloc emits an event that contains a the already present list of chats, it should do nothing',
        () {
      const updatedChats = AsyncValue<List<ChatEntity>>.loading();
      expectLater(
        sut.stream,
        emitsInOrder([]),
      );
      appBloc.add(const AppEvent.updateChats(chats: updatedChats));
    });
  });
}
