import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/core/value_objects.dart';
import '../../domain/user/user_entity.dart';
import '../../domain/core/dartz_option_ext.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String name,
    required String uid,
    required String email,
    required String profilePictureUrl,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  const UserModel._();

  UserEntity toEntity() {
    return UserEntity(
      name: Name(name),
      uid: UniqueId.fromExistingUid(uid),
      email: EmailAdress(email),
      profilePictureUrl: ProfilePictureUrl(profilePictureUrl),
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name.getOrCrash(),
      uid: entity.uid.getOrCrash(),
      email: entity.email.getOrCrash(),
      profilePictureUrl:
          entity.profilePictureUrl.value.fold((l) => '', (r) => r),
    );
  }
}
