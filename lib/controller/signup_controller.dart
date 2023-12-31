import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../constants/firebase_conts.dart';
import '../model/signup_model.dart';

class SignupController extends GetxController {
  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Check if the user already exists
      List<String> userAlreadyExist =
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      if (userAlreadyExist.isNotEmpty) {
        // User already exists, show toast and return
        Get.snackbar('Error', 'User already exists',);
        return;
      }

      // User does not exist, proceed with registration
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        UserModel userModel =
        UserModel(uid: user.uid, username: name, email: email);
        // userModel=UserModel(uid: user.uid, username: name, email: email);

        await usersCollection
            .doc(user.uid)
            .set(userModel.toMap());

        // Show success toast
        Get.snackbar('Success', 'Registration successful');
        Get.toNamed('/lgnSc');
      }
    } catch (e) {
      // Show error toast
      Get.snackbar('Error', 'Registration failed: $e');
    }
  }
}
