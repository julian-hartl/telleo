import PasswordHashService from "../../domain/encryption/password_hash_service";
import Bcrypt from "./bcrypt";

const passwordHashService: PasswordHashService = new Bcrypt();
export default passwordHashService;
