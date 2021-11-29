import 'package:telleo/domain/core/value_objects.dart';

import '../core/entity.dart';

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
