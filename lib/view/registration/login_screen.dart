import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:medlink/constants/text_style.dart';
import 'package:medlink/controller/login_controller.dart';
import 'package:medlink/view/registration/form_validation.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';
import '../../controller/checkbox_controller.dart';
import '../../controller/password_visibility_controller.dart';
import '../../services/google_signin.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final PasswordVisibleController passwordVisibleController =
  Get.put(PasswordVisibleController());
  final CheckboxController checkboxContoller = Get.put(CheckboxController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Circular gradient on top left
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
            // Circular gradient on bottom right
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
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 6.h,
                  left: 14.0,
                  right: 14.0,
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spaces.y5,
                      Spaces.y10,
                      Text('Xoş gəlmisiniz',
                          style: CustomFontStyle.fnt24ClrBWtB),
                      Spaces.y2,
                      Text(
                        textAlign: TextAlign.center,
                        'Asanlıqla tibb sahəsində ehtiyyacınız olan\n mütəxəssisin qəbuluna yazılın ',
                        style: CustomFontStyle.font12ClrGRY,
                      ),
                      Spaces.y3,
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
                          Spaces.x3,
                          CustomElevatedButton(
                            buttonText: 'Facebook',
                            backgroundColor: const Color(0xffFFFFFF),
                            textColor: Colors.black54,
                            width: 42.w,
                            height: 15.w,
                            onPressed: () {},
                            color: const Color(0xffFFFFFF),
                            surfaceTintColors: Colors.white,
                            icon: const Icon(Icons.facebook,
                                color: Color(0xff3b5998)),
                          ),
                        ],
                      ),
                      Spaces.y2,
                      TextFormField(
                        controller: emailController,
                        validator: (value) =>
                            FormValidation.validateEmail(value!),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {}, child: const Icon(Icons.check)),
                          labelText: 'Email',
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
                      Obx(
                            () {
                          return TextFormField(
                            controller: passwordController,
                            validator: (value) =>
                                FormValidation.validatePassword(value!),
                            obscureText:
                            !passwordVisibleController.isEyeOpen.value,
                            decoration: InputDecoration(
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
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: Colors.lightBlueAccent)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          );
                        },
                      ),
                      Spaces.y3,
                      CustomElevatedButton(
                        buttonText: 'Daxil olun',
                        backgroundColor: const Color(0xff61CEFF),
                        textColor: Colors.white,
                        width: 90.w,
                        height: 15.w,
                        onPressed: () => _submit(),
                        color: Colors.white,
                      ),
                      Spaces.y3,
                      GestureDetector(
                          onTap: () => _showModalBottomSheet(context),
                          child: Text(
                            'Şifrəni unutdum',
                            style: CustomFontStyle.font12ClrBLU,
                          )),
                      Spaces.y3,
                      GestureDetector(
                          onTap: () => Get.toNamed('/lgnSc'),
                          child: Text('Hesabınız yoxdur ? Qeydiyyat olun',
                              style: CustomFontStyle.font12ClrBLU)),
                      Spaces.y10,
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

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(14.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Şifrəni unutdum",
                style: CustomFontStyle.fnt24ClrBWtB,
              ),
              Spaces.y3,
              Text(
                  "4 rəqəmli verifikasiya kodunu əldə etmək üçün mailinizi əlaqə edin  ",
                  style: CustomFontStyle.font10ClrGRY),
              Spaces.y3,
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: forgotController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Spaces.y3,
              Center(
                child: CustomElevatedButton(
                  backgroundColor: const Color(0xff61CEFF),
                  textColor: Colors.white,
                  buttonText: 'Davam',
                  width: 10.w * 9,
                  height: 15.w,
                  onPressed: () {
                    sendEmail();
                  },
                  color: const Color(0xff61CEFF),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  void _showModalBottomSheetOTP(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(14.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("4 rəqəmli kod əlavə edin",
                  style: CustomFontStyle.fnt24ClrBWtB),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Mailınıza göndərilən 4 rəqəmli kodu əlavə edin  ",
                style: CustomFontStyle.font12ClrGRY,
              ),
              Spaces.y3,
              Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ) // TextField,
                      ),
                      SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ) // TextField,
                      ),
                      SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ) // TextField,
                      ),
                      SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ) // TextField,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CustomElevatedButton(
                  buttonText: 'Davam',
                  backgroundColor: const Color(0xff61CEFF),
                  textColor: Colors.white,
                  width: 10.w * 9,
                  height: 15.w,
                  onPressed: () => _showModalBottomSheetPassChange(context),
                  color: Colors.white,
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  void _showModalBottomSheetPassChange(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(14.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Şifrəni yeniləyin",
                style: CustomFontStyle.fnt24ClrBWtB,
              ),
              Spaces.y2,
              Text(
                "Hesabınıza daxil olmaq üçün yeni şifrə əlavə edin  ",
                style: CustomFontStyle.font12ClrGRY,
              ),
              Spaces.y3,
              Obx(() {
                return TextFormField(
                  obscureText: !passwordVisibleController.isEyeOpen.value,
                  decoration: InputDecoration(
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
                    labelText: 'Yeni şifrə',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                );
              }),
              Spaces.y2,
              Obx(() {
                return TextFormField(
                  obscureText: !passwordVisibleController.isEyeOpen.value,
                  decoration: InputDecoration(
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
                    labelText: 'Təkrar yeni şifrə',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CustomElevatedButton(
                  buttonText: 'yenilə',
                  backgroundColor: const Color(0xff61CEFF),
                  textColor: Colors.white,
                  width: 10.w * 9,
                  height: 15.w,
                  onPressed: () => Get.toNamed('/lgnSc'),
                  color: const Color(0xff61CEFF),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await loginController.loginUser(
          email: emailController.text,
          password: passwordController.text,
        );
      } catch (exception) {
        emailController.clear();
        passwordController.clear();
      }
    } else {
      emailController.clear();
      passwordController.clear();
      return;
    }
  }

  void sendEmail() {
    final auth = FirebaseAuth.instance;
    auth
        .sendPasswordResetEmail(email: forgotController.text.toString())
        .then((value) {
      _showModalBottomSheetOTP(context);
      Fluttertoast.showToast(
        msg: "Please check your spam folder  to reset your password!",
        backgroundColor: Colors.white,
        textColor: Colors.lightBlueAccent,
      );
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    });
  }
}
