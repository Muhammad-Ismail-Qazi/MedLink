import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:medlink/model/signup_model.dart';


class HomeScreenController {
  HomeScreenController();

  Future<UserModel?> getCurrentUserData() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      User? user = auth.currentUser;

      if (user != null) {
        UserModel? userModel;
        final  currentUser =
        await firestore.collection('users').doc(user.uid).get().then((value){
          return value.data();
        });

        if (currentUser!=null) {
          // Map<String, dynamic> userData =
          // currentUser.data() as Map<String, dynamic>;
          userModel=UserModel.fromMap(currentUser!);

          // String? userName = userData['username'];
          // String? profilePictureUrl = userData['profileUrl'];
          //
          // if (kDebugMode) {
          //   print("user name is : $userName");
          // }
          // userModel=UserModel(username:userName.toString(), email: '', uid: user.uid,profilePictureURL: profilePictureUrl);
          return userModel;
          // return UserModel(username: username, email: email, uid: uid);
        } else {
          if (kDebugMode) {
            print('User data not found in the users collection.');
          }

          return null;
        }
      } else {
        if (kDebugMode) {
          print('No user is signed in.');
        }

        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }

      return null;
    }
  }
}
