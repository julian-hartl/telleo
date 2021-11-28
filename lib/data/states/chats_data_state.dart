import 'package:injectable/injectable.dart';
import 'package:telleo/domain/entities/chat_entity.dart';
import 'package:telleo/domain/states/chats_data_state.dart';

@LazySingleton(as: ChatsDataState)
class TelleoChatsState implements ChatsDataState {
  TelleoChatsState() {
    _value = [];
  }

  @override
  void update(List<ChatEntity> value) {
    _value = value;
  }

  late List<ChatEntity> _value;

  @override
  List<ChatEntity> get value => _value;
}
