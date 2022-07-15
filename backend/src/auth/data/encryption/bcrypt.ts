import bcrypt from "bcrypt";
import PasswordHashService from "../../domain/encryption/password_hash_service";

export default class Bcrypt implements PasswordHashService {
  async hash(password: string): Promise<string> {
    return await bcrypt.hash(password, 10);
  }
  async compare(hashed: string, password: string): Promise<boolean> {
    return await bcrypt.compare(password, hashed);
  }
}
