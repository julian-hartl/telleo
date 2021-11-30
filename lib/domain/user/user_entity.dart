import '../core/base/entity.dart';
import '../core/value_objects.dart';

export '../core/value_objects.dart';

class UserEntity extends Entity {
  final Name name;
  final UniqueId uid;
  final EmailAdress email;
  UserEntity({
    required this.name,
    required this.uid,
    required this.email,
  });

  @override
  List<Object?> get props => [name, uid, email];
}
