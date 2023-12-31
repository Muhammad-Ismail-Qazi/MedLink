import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:medlink/constants/text_style.dart';
import 'package:medlink/controller/checkbox_controller.dart';
import 'package:sizer/sizer.dart';
import '../../Constants/space_values.dart';
import '../../controller/password_visibility_controller.dart';
import '../../controller/signup_controller.dart';
import '../../services/google_signin.dart';
import '../../widgets/custom_button.dart';
import 'form_validation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? checkCheckBox = false;
  final _formKey = GlobalKey<FormState>();
  final PasswordVisibleController passwordVisibleController =
  Get.put(PasswordVisibleController());
  final CheckboxController checkboxController = Get.put(CheckboxController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final SignupController signupController = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //there is topleft gradient
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 90.w,
                height: 50.h,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topLeft,
                    colors: [Colors.lightBlue.shade100, Colors.white],
                    radius: 1.0,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 80.w,
                height: 50.h,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.bottomRight,
                    colors: [Colors.green.shade100, Colors.white],
                    radius: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 6.h,
                left: 14.0,
                right: 14.0,
              ),
              child: Center(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spaces.y10,
                      Text(
                        textAlign: TextAlign.center,
                        'Axtarış üçün qeydiyyatdan  keçin',
                        style: CustomFontStyle.fnt24ClrBWtB,
                      ),
                      Spaces.y2,
                      Text(
                        textAlign: TextAlign.center,
                        'Asanlıqla tibb sahəsində ehtiyyacınız olan\n mütəxəssisin qəbuluna yazılın ',
                        style: CustomFontStyle.font12ClrGRY,
                      ),
                      Spaces.y5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomElevatedButton(
                            backgroundColor: const Color(0xffFFFFFF),
                            textColor: Colors.black54,
                            width: 42.w,
                            height: 15.w,
                            onPressed: () async {
                              UserCredential? userCredential =
                              await AuthManager.signInWithGoogle();
                              // Handle the userCredential as needed
                              if (userCredential != null) {
                                // Authentication successful, you can navigate or perform additional actions.
                              } else {
                                // Authentication failed or was cancelled.
                              }
                            },
                            color: const Color(0xffFFFFFF),
                            surfaceTintColors: Colors.white,
                            icon: const Center(
                              child:
                              Image(image: AssetImage('assets/google.png')),
                            ),
                            buttonText: 'Google',
                          ),
                          const SizedBox(width: 10),
                          CustomElevatedButton(
                            buttonText: 'Facebook',
                            backgroundColor: const Color(0xffFFFFFF),
                            textColor: Colors.black54,
                            width: 42.w,
                            height: 15.w,
                            onPressed: () {
                              Future<UserCredential>
                              signInWithFacebook() async {
                                // Trigger the sign-in flow
                                final LoginResult loginResult =
                                await FacebookAuth.instance.login();

                                // Create a credential from the access token
                                final OAuthCredential facebookAuthCredential =
                                FacebookAuthProvider.credential(
                                    loginResult.accessToken!.token);

                                // Once signed in, return the UserCredential
                                return FirebaseAuth.instance
                                    .signInWithCredential(
                                    facebookAuthCredential);
                              }
                            },
                            color: const Color(0xffFFFFFF),
                            surfaceTintColors: Colors.white,
                            icon: const Icon(Icons.facebook,
                                color: Color(0xff3b5998)),
                          ),
                        ],
                      ),
                      Spaces.y2,
                      TextFormField(
                        controller: nameController,
                        validator: (value) =>
                            FormValidation.validateName(value!),
                        decoration: InputDecoration(
                          labelText: 'Ad',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Spaces.y2,
                      TextFormField(
                        controller: emailController,
                        validator: (value) =>
                            FormValidation.validateEmail(value!),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors
                                  .lightBlueAccent, // Change the border color for the focused state
                            ),
                          ),
                        ),
                      ),
                      Spaces.y2,
                      Obx(() {
                        return TextFormField(
                          controller: passwordController,
                          validator: (value) =>
                              FormValidation.validatePassword(value!),
                          obscureText:
                          !passwordVisibleController.isEyeOpen.value,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                )),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                passwordVisibleController.changeVisibility();
                              },
                              child: Icon(
                                color: Colors.lightBlueAccent,
                                passwordVisibleController.isEyeOpen.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            labelText: 'Şifrə',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        );
                      }),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Obx(() {
                              return Checkbox(
                                activeColor: Colors.lightBlueAccent,
                                shape: const CircleBorder(),
                                value: CheckboxController.isChecked.value,
                                onChanged: (value) {
                                  checkboxController.checkBoxState();
                                  setState(() {});
                                },
                              );
                            }),
                          ),
                          Text(
                            'Təhlükəsizlik şərtləri və qanunları ilə razıyam',
                            style: CustomFontStyle.font10ClrGRY,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Spaces.y2,
                      CustomElevatedButton(
                        buttonText: 'Qeydiyyat olun',
                        backgroundColor: const Color(0xff61CEFF),
                        textColor: Colors.white,
                        width: 90.w,
                        height: 15.w,
                        onPressed: () => _submit(),
                        color: Colors.white,
                      ),
                      Spaces.y1,
                      GestureDetector(
                          onTap: () => Get.toNamed('/lgnSc'),
                          child: Text(
                            'Hesabınız var? Daxil olun',
                            style: CustomFontStyle.font12ClrBLU,
                          )),
                      Spaces.y5,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      if (!CheckboxController.isChecked.value) {
        Get.snackbar('Empty', 'Please accept the term and condition');
      } else {
        // Checkbox is selected, proceed with signup
        await signupController.registerUser(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        );
      }
    }
  }
}
