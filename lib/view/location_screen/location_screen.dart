import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';
import '../../widgets/custom_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Align(
            alignment: Alignment.bottomRight,
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

          // back button with text
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 3.w,
                                top: 0.7.h,
                                bottom: 0.7.h,
                                right: 1.w),
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
                        Text("Məkan Xidmətlərini aktivləşdirin",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Spaces.y6,
                    CircleAvatar(
                      backgroundColor: const Color(0xffbae2fd),
                      radius: 30.w,
                      child: ClipRRect(
                        child: Image.asset(
                          'assets/location.png',
                          width: 160, // Adjust the width of the image
                          height: 160, // Adjust the height of the image
                          fit: BoxFit.cover, // You can choose how the image fits within the circular avatar
                        ),
                      ),
                    ),
                    Spaces.y3,
                    Text("Məkan",
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold)),
                    Spaces.y3,
                    Text(
                        textAlign: TextAlign.center,
                        "Məkan xidmətləriniz söndürülüb. Zəhmət olmasa daha yaxşı xidmət göstərməmizə kömək etmək üçün məkanı aktivləşdirin.",
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 10.sp,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold)),
                    Spaces.y4,
                    CustomElevatedButton(
                        height: 6.h,
                        buttonText: "İcazə ver",
                        backgroundColor: Colors.lightBlue.shade200,
                        textColor: Colors.white,
                        width: 90.w,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Get.toNamed('/mdcordrSc');
                        },
                        color: Colors.lightBlue.shade200),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
