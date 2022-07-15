export default interface PasswordHashService {
  hash(password: string): Promise<string>;
  compare(hashedPassword: string, password: string): Promise<boolean>;
}
