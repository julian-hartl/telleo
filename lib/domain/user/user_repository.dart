import 'package:dartz/dartz.dart';

import 'package:telleo/domain/user/user_entity.dart';
import 'package:telleo/domain/user/user_failures.dart';

abstract class UserRepository {
  Future<Either<UserFailure, Option<UserEntity>>> getCurrentUser();
}
