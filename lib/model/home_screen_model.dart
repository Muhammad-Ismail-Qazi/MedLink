import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:medlink/controller/home_screen_controller.dart';

class HomeScreenModel {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final HomeScreenController controller = HomeScreenController();

  Future<String> getCurrentUserName() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        DocumentSnapshot currentUser =
            await firestore.collection('users').doc(user.uid).get();
        if (currentUser.exists) {
          Map<String, dynamic> userData =
              currentUser.data() as Map<String, dynamic>;
          String userName = userData['user_name'];
          return userName;
        } else {
          if (kDebugMode) {
            print('User data not found in the users collection.');
          }
          return '';
        }
      } else {
        if (kDebugMode) {
          print('No user is signed in.');
        }
        return '';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }
      return '';
    }
  }
}
