import '../core/async_value.dart';
import '../core/base/value_state.dart';
import 'chat_entity.dart';

abstract class CurrentChatsState extends ValueState<List<ChatEntity>> {}
