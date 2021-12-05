import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/core/async_value.dart';

import '../../domain/chats/chat_entity.dart';
import '../../domain/chats/chats_state.dart';

@LazySingleton(as: ChatsState)
class TelleoChatsState extends ChatsState {
  AsyncValue<List<ChatEntity>> _value = const AsyncValue.loading();

  @override
  void update(AsyncValue<List<ChatEntity>> value) {
    _value = value;
  }

  @override
  AsyncValue<List<ChatEntity>> get value => _value;
}
