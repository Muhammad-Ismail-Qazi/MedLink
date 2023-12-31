import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  late String username;
  late String email;
  late String uid;
  String? profilePictureURL;

  UserModel({
    required this.username,
    required this.email,
    required this.uid,
    this.profilePictureURL
  });
  // Whenever you get data from the db, use this method to populate the user model
  UserModel.fromMap(Map<String, dynamic> map) {
    username = map['username'];
    email = map['email'];
    uid = map['uid'];
    profilePictureURL = map['profileUrl'];
  }

  // Whenever you want to send data to the db, use this method to convert object data to JSON data
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'uid': uid,
      'profileUrl': profilePictureURL,
    };
  }
}
