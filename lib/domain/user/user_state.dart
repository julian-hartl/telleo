import 'package:dartz/dartz.dart';
import '../core/async_value.dart';

import '../core/base/value_state.dart';
import 'user_entity.dart';

abstract class UserState extends ValueState<AsyncValue<Option<UserEntity>>> {
  UserEntity getOrCrash();
}
