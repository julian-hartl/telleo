import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_failure_event.dart';
part 'chat_failure_state.dart';
part 'chat_failure_bloc.freezed.dart';

@lazySingleton
class ChatFailureBloc extends Bloc<ChatFailureEvent, ChatFailureState> {
  ChatFailureBloc() : super(const ChatFailureState.initial()) {
    on<_CouldNotSendMessage>((event, emit) {
      emit(const ChatFailureState.couldNotSendMessage());
    });
    on<_NoConnection>((event, emit) {
      emit(const ChatFailureState.noConnection());
    });
    on<_ServerError>((event, emit) {
      emit(const ChatFailureState.serverError());
    });
  }
}
