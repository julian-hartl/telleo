import '../core/entity.dart';

class UserEntity implements Entity {
  final String name;
  final String uid;
  final String email;
  UserEntity({
    required this.name,
    required this.uid,
    required this.email,
  });
}
