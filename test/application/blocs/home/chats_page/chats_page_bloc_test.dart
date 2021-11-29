import 'package:flutter_test/flutter_test.dart';
import 'package:telleo/application/blocs/home/chats_page/chats_page_bloc.dart';
import 'package:telleo/domain/core/async_value.dart';

void main() {
  group('ChatsPageBloc', () {
    late ChatsPageBloc sut;

    setUp(() {
      sut = ChatsPageBloc();
    });

    test('initial state should be as shown below', () {
      const expectedInitial = AsyncValue.loading();

      expect(sut.state, expectedInitial);
    });

    group('LoadingChats', () {
      test('it should emit a loading state', () {
        const expected = AsyncValue.loading();

        expectLater(sut.stream, emitsInOrder([expected]));
        sut.add(const ChatsPageEvent.loadingChats());
      });
    });

    group('RetrievedChats', () {
      test(
        'it should emit AsyncValue.data with the data that has been gotten from ChatBloc',
        () {},
      );
    });
  });
}
