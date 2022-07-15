import mongoose from "mongoose";
import RefreshTokenEntity from "../../domain/tokens/refresh_token_entity";

const refreshTokenSchema = new mongoose.Schema<RefreshTokenEntity>({
  token: {
    type: String,
    unique: true,
    required: true,
  },
});

const RefreshTokenModel = mongoose.model<RefreshTokenEntity>(
  "RefreshToken",
  refreshTokenSchema
);

export default RefreshTokenModel;
