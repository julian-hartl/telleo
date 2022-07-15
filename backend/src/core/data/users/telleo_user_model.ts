import UserEntity from "../../domain/users/user_entity";

export default class TelleoUserModel {
  constructor(
    public readonly name: string,
    public readonly uid: string,
    public readonly email: string,
    public readonly profilePictureUrl: string
  ) {}

  static fromEntityList(users: UserEntity[]): TelleoUserModel[] {
    return users.map((user) => TelleoUserModel.fromEntity(user));
  }

  static toEntityList(users: TelleoUserModel[]): UserEntity[] {
    return users.map((user) => user.toEntity());
  }

  static fromJson(json: any): TelleoUserModel {
    return new TelleoUserModel(
      json.name,
      json.uid,
      json.email,
      json.profilePictureUrl
    );
  }

  toEntity(): UserEntity {
    return new UserEntity(
      this.uid,
      this.email,
      "",
      this.name,
      this.profilePictureUrl
    );
  }

  static fromEntity(entity: UserEntity): TelleoUserModel {
    return new TelleoUserModel(
      entity.name,
      entity.id,
      entity.email,
      entity.profilePictureUrl
    );
  }
}
