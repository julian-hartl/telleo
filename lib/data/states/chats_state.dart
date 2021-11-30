import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/chats/chat_entity.dart';
import '../../domain/chats/chats_state.dart';

@LazySingleton(as: CurrentChatsState)
class TelleoChatsState extends CurrentChatsState {
  late Option<List<ChatEntity>> _value;

  @override
  void update(Option<List<ChatEntity>> value) {
    _value = value;
  }

  @override
  Option<List<ChatEntity>> get value => _value;
}
