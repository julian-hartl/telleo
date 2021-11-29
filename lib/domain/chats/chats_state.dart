import '../core/async_value.dart';

import 'chat_entity.dart';
import '../core/base/value_state.dart';

abstract class ChatsState extends ValueState<AsyncValue<List<ChatEntity>>> {}
