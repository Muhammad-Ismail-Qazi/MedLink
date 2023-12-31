import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medlink/model/signup_model.dart';


class LoginController{
Rx<UserModel> userModel= UserModel(username: '', email: '', uid: '').obs;
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {

        userModel.value=UserModel(username: user.displayName.toString(), email: user.email.toString(), uid: user.uid);
        // Authentication successful,
        Get.toNamed('/hmepge');
        Get.snackbar("Success", 'Login Successfully');
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
      Get.snackbar("Failed", 'Login failed');
    }
  }

}