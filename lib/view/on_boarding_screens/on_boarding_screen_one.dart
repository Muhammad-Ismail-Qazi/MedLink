import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/constants/text_style.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';
import '../../widgets/custom_button.dart';

class OnBoardingOneScreen extends StatefulWidget {
  const OnBoardingOneScreen({super.key});

  @override
  State<OnBoardingOneScreen> createState() => _OnBoardingOneScreenState();
}

class _OnBoardingOneScreenState extends State<OnBoardingOneScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          // top left blue circle
          Positioned(
            top: -50.w,
            left: -10.h,
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
          // circular image
          Positioned(
            top: 16.h,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35.w,
                    backgroundImage: const AssetImage('assets/doctoronboard.png'),
                  ),
                  // space
                  Spaces.y10,
                   Text(
                    'Etibarlı Həkimləri tapın',
                     style: CustomFontStyle.fnt24ClrBWtB,
                  ),
                  //space
                  Spaces.y3,
                   Center(
                    child: Text(
                      'Etibarlı tibb işçiləri artıq hər an , bir tıklama\n qədər yanınızdadırlar...',
                      style: CustomFontStyle.font12ClrGRY,
                      textAlign: TextAlign
                          .center, // Optional, centers the text within the Text widget
                    ),
                  ),

                  //space
                  Spaces.y4,
                   CustomElevatedButton(
                    buttonText: 'Başlayın',
                    backgroundColor: const Color(0xff61CEFF),
                    textColor: Colors.white,
                    width: 80.w,
                    height: 8.h,
                    onPressed: () {
                      Get.toNamed('/signup');
                    },
                     color: const Color(0xff61CEFF),
                  ),

                  Spaces.y2,
                  GestureDetector(
                    onTap: () => Get.toNamed('/onbrdSc2'),
                    child:  Text(
                      'Keç',
                      style: CustomFontStyle.font12ClrBLU
                    ),
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
