import '../core/async_value.dart';
import '../core/base/value_state.dart';
import 'chat_entity.dart';

abstract class ChatsState extends ValueState<AsyncValue<List<ChatEntity>>> {}
