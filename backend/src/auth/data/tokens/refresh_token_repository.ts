import RefreshTokenRepository from "../../domain/tokens/refresh_token_repository";
import TelleoRefreshTokenRepository from "./telleo_refresh_token_repository";

const refreshTokenRepository: RefreshTokenRepository =
  new TelleoRefreshTokenRepository();
export default refreshTokenRepository;
