import 'package:dartz/dartz.dart';
import 'package:telleo/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Option<UserEntity>> getCurrentUser();
}
