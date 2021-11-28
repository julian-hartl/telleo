import '../core/entity.dart';

class UserEntity extends Entity {
  final String name;
  final String uid;
  final String email;
  UserEntity({
    required this.name,
    required this.uid,
    required this.email,
  });

  @override
  List<Object?> get props => [name, uid, email];
}
