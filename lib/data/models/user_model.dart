import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telleo/domain/core/value_objects.dart';
import 'package:telleo/domain/user/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String name,
    required String uid,
    required String email,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  const UserModel._();

  UserEntity toEntity() {
    return UserEntity(
      name: Name(name),
      uid: UniqueId.fromExistingUid(uid),
      email: EmailAdress(email),
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name.getOrCrash(),
      uid: entity.uid.getOrCrash(),
      email: entity.email.getOrCrash(),
    );
  }
}
