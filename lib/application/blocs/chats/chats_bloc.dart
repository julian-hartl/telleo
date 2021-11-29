import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/domain/chats/chats_repository.dart';
import 'package:telleo/domain/chats/chats_data_state.dart';

part 'chats_event.dart';
part 'chats_state.dart';
part 'chats_bloc.freezed.dart';

@lazySingleton
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatsDataState chatsState;
  final ChatsRepository chatsRepository;

  ChatsBloc(this.chatsState, this.chatsRepository) : super(const _Initial()) {
    on<RequestChats>((event, emit) async {
      emit(const ChatsState.loading());
      final chatsResult = await chatsRepository.getChats();
      chatsResult.fold((failure) {
        failure.map(
          serverError: (_) {
            emit(const ChatsState.error(message: 'Internal server error'));
          },
          noConnection: (_) {
            emit(const ChatsState.error(
                message: 'Please check your connection'));
          },
        );
      }, (chats) {
        chatsState.update(chats);
        emit(const ChatsState.retrieved());
      });
    });
  }
}
