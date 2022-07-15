import TokenService from "../../domain/tokens/token_service";
import JWT from "./jwt";

const tokenService: TokenService = new JWT();
export default tokenService;
