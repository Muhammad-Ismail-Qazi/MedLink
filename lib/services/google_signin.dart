import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/signup_model.dart';

class AuthManager {
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Check if the user already exists
      UserCredential? userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Save user information to the database

      saveUserInfoToDatabase(
        uid: userCredential.user?.uid ?? "",
        name: googleUser?.displayName ?? "",
        email: googleUser?.email ?? "",
        profileUrl: googleUser?.photoUrl ?? "",
      );

      // UI-related actions
      _onSuccessfulLogin();
      return userCredential;
    } catch (e) {
      _onLoginError(e.toString());
      return null;
    }
  }

  static void saveUserInfoToDatabase({
    required String uid,
    required String name,
    required String email,
    required String profileUrl,
  }) async {
    try {
      UserModel userModel =
      UserModel(uid: uid, username: name, email: email,profilePictureURL: profileUrl);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(userModel.toMap());
    } catch (e) {
      if (kDebugMode) {
        print('Error saving user info to database: $e');
      }
    }
  }

  static void _onSuccessfulLogin() {
    Get.snackbar('Success', 'Login successful');
    Get.toNamed('/hmepge'); // Redirect to the desired page
  }

  static void _onLoginError(String errorMessage) {
    Get.snackbar('Error', 'Login failed: $errorMessage');
    if (kDebugMode) {
      print(errorMessage);
    }
  }
}
