import 'package:dartz/dartz.dart';

import '../core/base/entity.dart';
import '../core/value_objects.dart';

export '../core/value_objects.dart';

class UserEntity extends Entity {
  final String name;
  final String uid;
  final String email;
  final String profilePictureUrl;
  UserEntity({
    required this.name,
    required this.uid,
    required this.email,
    required this.profilePictureUrl,
  });

  @override
  List<Object?> get props => [name, uid, email];
}
