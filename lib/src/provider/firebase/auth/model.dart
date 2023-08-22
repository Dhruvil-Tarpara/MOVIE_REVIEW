import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final String? error;
  final User? user;

  UserData({
    this.error,
    this.user,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        error: json["error"],
        user: json["user"],
      );
}
