import 'package:dartz/dartz.dart';
import 'package:telleo/domain/user/user_failures.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<UserFailure, Option<UserEntity>>> getCurrentUser();
}
