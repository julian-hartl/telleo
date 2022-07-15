import JWT from "../tokens/jwt";

import UserRepository from "../../domain/users/user_repository";
import TelleoUserRepository from "./telleo_user_repository";
import TokenService from "../../domain/tokens/token_service";

const tokenService: TokenService = new JWT();
const userRepository: UserRepository = new TelleoUserRepository(tokenService);

export default userRepository;
