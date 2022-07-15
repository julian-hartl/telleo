export default class ErrorCodes {
  static routeNotFound: number = 100;
  static internalServerError: number = 101;
  static missingProperty: number = 102;
  static badProperty: number = 103;
  static Auth = class {
    static wrongPassword: number = 200;
    static emailAlreadyInUse: number = 201;
    static emailNotFound: number = 202;
    static invalidEmail: number = 203;
    static invalidPassword: number = 204;
    static tokenExpired: number = 205;
    static invalidRefreshToken: number = 206;
  };
  static Users = class {
    static userNotFound: number = 300;
  };
  static Chats = class {
    static chatNotFound: number = 400;
    static chatAlreadyExists: number = 401;
    static invalidNumberOfUsers: number = 402;
    static chatWithSameUser: number = 403;
  };
  static Friends = class {
    static alreadyFriends: number = 500;
  };
}
