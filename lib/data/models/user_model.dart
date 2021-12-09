import 'package:json_annotation/json_annotation.dart';

import '../../domain/core/value_objects.dart';
import '../../domain/user/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(defaultValue: 'Name lol')
  final String name;

  final String uid;
  final String email;

  @JsonKey(
      defaultValue:
          'https://www.senertec.de/wp-content/uploads/2020/04/blank-profile-picture-973460_1280.png')
  final String profilePictureUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  const UserModel({
    required this.name,
    required this.email,
    required this.profilePictureUrl,
    required this.uid,
  });

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
