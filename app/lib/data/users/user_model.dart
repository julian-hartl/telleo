import 'package:json_annotation/json_annotation.dart';

import '../../domain/core/value_validators.dart';
import '../../domain/user/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  static const defaultProfilePictureUrl =
      'https://gepa-mbh.de/wp-content/uploads/2019/01/blank-profile-picture-973460-300x300.png';

  static const defaultName = 'user';

  @JsonKey(defaultValue: defaultName)
  final String name;

  final String uid;
  final String email;

  @JsonKey(defaultValue: defaultProfilePictureUrl)
  final String profilePictureUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel({
    required String name,
    required this.email,
    required String profilePictureUrl,
    required this.uid,
  })  : profilePictureUrl = validateUrl(profilePictureUrl)
            .fold((l) => defaultProfilePictureUrl, (r) => r),
        name = validateName(name).fold((l) => defaultName, (r) => r);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      uid: uid,
      email: email,
      profilePictureUrl: profilePictureUrl,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      uid: entity.uid,
      email: entity.email,
      profilePictureUrl: entity.profilePictureUrl,
    );
  }
}
