import { Option } from "funpjs";

export default interface RefreshTokenRepository {
  exists(token: string): Promise<boolean>;
  save(token: string): Promise<Option<string>>;
}
