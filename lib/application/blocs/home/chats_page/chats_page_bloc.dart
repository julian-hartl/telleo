import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/domain/chats/chat_entity.dart';

part 'chats_page_event.dart';
part 'chats_page_state.dart';
part 'chats_page_bloc.freezed.dart';

class ChatsPageBloc extends Bloc<ChatsPageEvent, ChatsPageState> {
  ChatsPageBloc() : super(_Initial()) {
    on<ChatsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
