import 'package:injectable/injectable.dart';
import '../../domain/user/user_entity.dart';
import '../../domain/user/user_state.dart';

@LazySingleton(as: UserState)
class TelleoUserState implements UserState {
  @override
  UserEntity? value;

  @override
  void update(UserEntity? t) {
    value = t;
  }
}
