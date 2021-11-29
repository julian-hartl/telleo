import 'package:dartz/dartz.dart';

import 'user_entity.dart';
import 'user_failures.dart';

abstract class UserRepository {
  Future<Either<UserFailure, Option<UserEntity>>> getCurrentUser();
}
