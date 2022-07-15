import mongoose, { Document } from "mongoose";
import UserEntity from "../../domain/users/user_entity";

interface UserDocument extends Document {
  email: string;
  password: string;
  name: string;
  profilePictureUrl: string;
  friends: mongoose.Types.ObjectId[];

  mapToUserEntity(): Promise<UserEntity>;
}

const userSchema = new mongoose.Schema<UserDocument>(
  {
    email: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
    },
    name: {
      type: String,
      default: "",
    },
    profilePictureUrl: {
      type: String,
      default: "",
    },
    friends: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
      },
    ],
  },
  { timestamps: true }
);

userSchema.methods.mapToUserEntity = async function (): Promise<UserEntity> {
  // const populated = await this.populate("User");

  return new UserEntity(
    this.id,
    this.email,
    this.password,
    this.name,
    this.profilePictureUrl,
    // this.friends as unknown as UserEntity[]: does not work, even when populated
    this.friends.map((id) => id.toHexString())
  );
};

userSchema.set("toJSON", {
  virtuals: true,
});

const UserModel = mongoose.model<UserDocument>("User", userSchema);
export default UserModel;
