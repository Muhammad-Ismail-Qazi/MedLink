import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/constants/text_style.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';
import '../../widgets/custom_button.dart';

class OnBoardingThreeScreen extends StatefulWidget {
  const OnBoardingThreeScreen({super.key});

  @override
  State<OnBoardingThreeScreen> createState() => _OnBoardingThreeScreenState();
}

class _OnBoardingThreeScreenState extends State<OnBoardingThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // top left blue circle
          Positioned(
            top: -20.h,
            right: -20.w,
            child: Container(
              padding: const EdgeInsets.only(left: 8.0),
              width: 70.w,
              height: 70.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
            ),
          ),

          // circular image
          Positioned(
            top: 16.h,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35.w,
                  backgroundImage: const AssetImage('assets/onbrd3.png'),
                ),
                // space
               Spaces.y10,
                 Text(
                  'Asan qeydiyyat',
                  style: CustomFontStyle.fnt24ClrBWtB,
                ),
                //space
                Spaces.y2,
                 Center(
                  child: Text(
                    'Həkim qəbulu hələ bu qədər asan olmamışdı...',
                    style: CustomFontStyle.font12ClrGRY,
                    textAlign: TextAlign
                        .center, // Optional, centers the text within the Text widget
                  ),
                ),

                //space
                Spaces.y5,
                CustomElevatedButton(
                  buttonText: 'Başlayın',
                  backgroundColor: const Color(0xff61CEFF),
                  textColor: Colors.white,
                  width: 80.w,
                  height: 8.h,
                  onPressed: () => Get.toNamed('/signup'),
                  color: Colors.white,
                ),

                Spaces.y3,
                GestureDetector(
                  onTap: () => Get.toNamed('/signup'),
                  child:  Text(
                    'Keç',
                    style: CustomFontStyle.font12ClrBLU,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -10.h,
            right: -10.w,
            child: Container(
              padding: const EdgeInsets.only(left: 8.0),
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xff61CEFF).withOpacity(0.2),

                  ],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff61CEFF).withOpacity(0.28),
                    blurStyle: BlurStyle.normal,
                    blurRadius: 200,
                    spreadRadius: 100,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
