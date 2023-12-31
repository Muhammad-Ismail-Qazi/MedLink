import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlink/constants/text_style.dart';
import 'package:medlink/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/space_values.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _imageFile;
  bool isTextFieldEnabled = false;
  String? profilePictureURL;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 80.w,
              height: 40.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomRight,
                  colors: [
                    Colors.green.shade200,
                    Colors.green.shade100,
                    Colors.white
                  ],
                  radius: 1.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.lightBlueAccent,
              ),
              height: 45.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 5.w),
                          padding: EdgeInsets.only(
                              left: 3.w, top: 0.7.h, bottom: 0.7.h, right: 1.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Spaces.x4,
                      Text("Hesab",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spaces.y3,
                  Text(
                    "Profilinizi tənzimləyin",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Spaces.y1,
                  const Text(
                    "Həkiminizlə əlaqə saxlamaq üçün profilinizi \nməlumatlarınızla doldurun",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spaces.y2,
                  Stack(children: [
                    CircleAvatar(
                      radius: 9.h,
                      backgroundImage: _imageFile == null
                          ? (profilePictureURL != null
                              ? Image.network(profilePictureURL!).image
                              : const AssetImage(
                                  'assets/placeholder_image.png'))
                          : _imageFile != null
                              ? FileImage(File(_imageFile!.path))
                              : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0.5.w,
                      child: CircleAvatar(
                        backgroundColor: Colors.black26,
                        child: GestureDetector(
                          onTap: () => _showModalBottomSheet(context),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 53.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Şəxsi  məlumatlar",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spaces.y2,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 1.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ad Soyad",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 9.sp),
                              ),
                              Spaces.y1,
                              const Text(
                                "Nigar Majidova",
                              )
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                Get.toNamed('/edtprflSC',
                                    arguments: {"title": "Adınız?"});
                              },
                              child:
                                  const Icon(Icons.edit, color: Colors.grey)),
                        ],
                      ),
                    ),
                    Spaces.y2,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 1.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Əlaqə telefonu",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 9.sp),
                              ),
                              Spaces.y1,
                              const Text(
                                "+994 55 209 08 18",
                              )
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                Get.toNamed('/edtprflSC',
                                    arguments: {"title": "Əlaqə telefonu?"});
                              },
                              child:
                                  const Icon(Icons.edit, color: Colors.grey)),
                        ],
                      ),
                    ),
                    Spaces.y2,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 1.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Doğum tarixi",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 9.sp),
                              ),
                              Spaces.y1,
                              const Text(
                                "GG AA İİİİ",
                              )
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                Get.toNamed('/edtprflSC',
                                    arguments: {"title": "Doğum tarixi?"});
                              },
                              child:
                                  const Icon(Icons.edit, color: Colors.grey)),
                        ],
                      ),
                    ),
                    Spaces.y2,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 1.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lokasiya",
                            style: TextStyle(
                                color: Colors.lightBlueAccent, fontSize: 9.sp),
                          ),
                          Spaces.y1,
                          const Text(
                            "Ünvan əlavə edin",
                          )
                        ],
                      ),
                    ),
                    Spaces.y5,
                    Center(
                      child: CustomElevatedButton(
                          buttonText: "Davam",
                          backgroundColor: Colors.lightBlueAccent,
                          textColor: Colors.white,
                          width: 80.w,
                          height: 6.5.h,
                          onPressed: () {
                            uploadProfilePicture();
                          },
                          color: Colors.lightBlueAccent),
                    ),
                    Spaces.y2,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 20.h,
          padding: const EdgeInsets.all(14.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Choose profile photo', style: CustomFontStyle.font16ClrB),
              Spaces.y1,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      takePhoto(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 10.w,
                      child: Icon(Icons.camera_alt,
                          color: Colors.lightBlueAccent, size: 10.w),
                    ),
                  ),
                  Spaces.x3,
                  InkWell(
                    onTap: () {
                      takePhoto(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 10.w,
                      child: Icon(Icons.photo_library,
                          color: Colors.lightBlueAccent, size: 10.w),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // take photo
  void takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  // Function to upload profile picture
  Future<void> uploadProfilePicture() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null && _imageFile != null) {
        // Get the reference to the user's profile picture in Firebase Storage
        String fileName = 'profile_${user.uid}.jpg';
        Reference storageReference =
            firebaseStorage.ref().child('profileImages').child(fileName);

        // Upload the image file to Firebase Storage
        await storageReference.putFile(File(_imageFile!.path));

        // Get the URL of the uploaded image
        String downloadURL = await storageReference.getDownloadURL();
        profilePictureURL = downloadURL;

        // Update the profile picture URL in Firestore
        DocumentReference<Map<String, dynamic>> userRef =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        await userRef.update({
          'profilePicture': downloadURL,
        });

        Fluttertoast.showToast(
          msg: "Successfully updated your profile picture!",
          backgroundColor: Colors.white,
          textColor: Colors.lightBlueAccent,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading profile picture: $e');
      }
    }
  }
}
