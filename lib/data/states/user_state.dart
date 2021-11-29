import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/core/async_value.dart';
import '../../domain/user/user_entity.dart';
import '../../domain/user/user_state.dart';

@LazySingleton(as: UserState)
class TelleoUserState extends UserState {
  @override
  Future<void> load() {
    // TODO: implement load
    throw UnimplementedError();
  }

  AsyncValue<Option<UserEntity>> _value = const AsyncLoading();

  @override
  AsyncValue<Option<UserEntity>> get state => value;

  @override
  void update(AsyncValue<Option<UserEntity>> value) {
    _value = value;
  }

  @override
  AsyncValue<Option<UserEntity>> get value => _value;
}
