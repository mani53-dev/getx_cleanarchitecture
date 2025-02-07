import 'package:artools/artools.dart';

class User extends Model {
  int? userId;
  String? userName;
  String? email;
  String? password;
  bool? auth;
  String? avatarURL;
  String? apiToken;

  User({
    this.userId,
    this.userName,
    this.email,
    this.password,
    this.auth,
    this.avatarURL,
    this.apiToken,
  });

  factory User.fromJson(JsonMap json) {
    return User(
      userId: Model.intFromJson(json, 'id'),
      userName: Model.stringFromJson(json, 'name'),
      email: Model.stringFromJson(json, 'email'),
      password: Model.stringFromJson(json, 'password'),
      avatarURL: Model.stringFromJson(json, 'avatarURL'),
      auth: Model.boolFromJson(json, 'auth'),
      apiToken: Model.stringFromJson(json, 'token'),
    );
  }

  JsonMap toJson() {
    return {
      'id': userId,
      'name': userName,
      'email': email,
      'token': apiToken,
      'password': password,
      'auth': auth,
      'avatarURL': avatarURL,
    };
  }

  @override
  String toString() {
    return 'User{'
        'userId: $userId, '
        'userName: $userName, '
        'email: $email, '
        'apiToken: $apiToken, '
        'password: $password, '
        'auth: $auth, '
        'avatarURL: $avatarURL'
        '}';
  }
}
