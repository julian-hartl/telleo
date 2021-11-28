import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/domain/user/user_failures.dart';
import '../../domain/user/user_repository.dart';
import '../../domain/entities/user_entity.dart';

@LazySingleton(as: UserRepository)
class TelleoUserRepository implements UserRepository {
  @override
  Future<Either<UserFailure, Option<UserEntity>>> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return right(some(
      UserEntity(
        name: 'Lizzie Walker',
        uid: 'WXxJvAdQMkvYzCZOstbG',
        email: 'kosugow@ote.ec',
      ),
    ));
  }
}
