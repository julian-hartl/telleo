import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel implements UserEntity {
  const factory UserModel({
    required String name,
    required String uid,
    required String email,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  const UserModel._();

  @JsonKey(ignore: true)
  @override
  List<Object?> get props => [name, uid, email];

  @JsonKey(ignore: true)
  @override
  bool? get stringify => true;
}
