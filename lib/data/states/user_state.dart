import 'package:injectable/injectable.dart';
import 'package:telleo/domain/entities/user_entity.dart';
import 'package:telleo/domain/states/user_state.dart';

@LazySingleton(as: UserState)
class TelleoUserState implements UserState {
  @override
  UserEntity? value;

  @override
  void update(UserEntity? t) {
    value = t;
  }
}
