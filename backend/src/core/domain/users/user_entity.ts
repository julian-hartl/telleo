export default class UserEntity {
  constructor(
    public readonly id: string,
    public readonly email: string,
    public readonly password: string,
    public readonly name: string,
    public readonly profilePictureUrl: string,
    public readonly friends: string[] = []
  ) {}
}
