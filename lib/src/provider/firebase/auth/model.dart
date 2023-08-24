import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final String? error;
  final Users? user;

  UserData({
    this.error,
    this.user,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        error: json["error"],
        user: json["user"],
      );
}

class Users {
  final String? id;
  final String? userName;
  final String? url;
  final String? email;
  final bool? emailVarify;

  Users({this.id, this.userName, this.url, this.email, this.emailVarify});

  factory Users.fromDocument(User? doc) {
    return Users(
        id: doc?.uid,
        email: doc?.email,
        userName: doc?.displayName,
        url: doc?.photoURL,
        emailVarify: doc?.emailVerified);
  }

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        email: json["email"],
        emailVarify: json["emailVarify"],
        id: json["userId"],
        url: json["url"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "userId": id,
        "userName": userName,
        "url": url,
        "email": email,
        "emailVarify": emailVarify,
      };
}
