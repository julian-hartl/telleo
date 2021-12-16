import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/base/entity.dart';

export '../core/value_objects.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String name,
    required String uid,
    required String email,
    required String profilePictureUrl,
  }) = _UserEntity;
}
