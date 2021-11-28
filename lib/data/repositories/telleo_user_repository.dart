import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/domain/core/repositories/user_repository.dart';
import 'package:telleo/domain/entities/user_entity.dart';

@LazySingleton(as: UserRepository)
class TelleoUserRepository implements UserRepository {
  @override
  Future<Option<UserEntity>> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return some(
      UserEntity(
        name: 'Lizzie Walker',
        uid: 'WXxJvAdQMkvYzCZOstbG',
        email: 'kosugow@ote.ec',
      ),
    );
  }
}
