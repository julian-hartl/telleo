import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/user/user_repository.dart';
import '../../domain/user/user_entity.dart';
import '../../domain/user/user_state.dart';

@LazySingleton(as: UserState)
class TelleoUserState extends UserState {
  final UserRepository userRepository;

  TelleoUserState(this.userRepository);

  Option<UserEntity> _value = none();

  @override
  void update(Option<UserEntity> value) {
    _value = value;
  }

  @override
  Option<UserEntity> get value => _value;
}
