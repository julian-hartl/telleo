import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/domain/core/dartz_option_ext.dart';

import '../../domain/core/async_value.dart';
import '../../domain/user/user_entity.dart';
import '../../domain/user/user_repository.dart';
import '../../domain/user/user_state.dart';

@LazySingleton(as: UserState)
class TelleoUserState extends UserState {
  final UserRepository userRepository;

  TelleoUserState(this.userRepository);

  AsyncValue<Option<UserEntity>> _value = const AsyncValue.loading();

  @override
  void update(AsyncValue<Option<UserEntity>> value) {
    _value = value;
  }

  @override
  AsyncValue<Option<UserEntity>> get value => _value;

  @override
  UserEntity getOrCrash() {
    return value.map(
      data: (value) => value.data.getOrCrash(),
      loading: (_) {
        throw Error();
      },
      error: (_) {
        throw Error();
      },
    );
  }
}
