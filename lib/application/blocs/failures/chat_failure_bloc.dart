import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_failure_event.dart';
part 'chat_failure_state.dart';
part 'chat_failure_bloc.freezed.dart';

class ChatFailureBloc extends Bloc<ChatFailureEvent, ChatFailureState> {
  ChatFailureBloc() : super(_Initial()) {
    on<ChatFailureEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
