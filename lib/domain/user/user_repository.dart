import 'package:dartz/dartz.dart';

import 'user_entity.dart';
import 'user_failures.dart';

abstract class UserRepository {
  Future<Either<UserFailure, UserEntity>> getCurrentUser();
  Future<Either<UserFailure, List<UserEntity>>> searchUsers({String? query});
  Future<Either<UserFailure, UserEntity>> updateUser(UserEntity user);
}
