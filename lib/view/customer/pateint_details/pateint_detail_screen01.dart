import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/space_values.dart';

class PateintDetailsScreenOne extends StatelessWidget {
  const PateintDetailsScreenOne({super.key});

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
        Positioned(
          top: 5.h,
          child: Row(
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
              Text("Pasient Malumatlari",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
            ],
          ),
        ),

        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 14.h,
                backgroundColor: Colors.greenAccent.withOpacity(0.2),
                child: Icon(
                  CupertinoIcons.folder_fill_badge_plus,
                  color: Colors.lightBlueAccent,
                  size: 12.h,
                ),
              ),
              Spaces.y3,
              Text(
                "Qovluq bosdur",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spaces.y3,
              CustomElevatedButton(
                  buttonText: "Test elava et",
                  backgroundColor: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  width: 90.w,
                  height: 6.5.h,
                  onPressed: () {
                    Get.toNamed('/detail_form');
                  },
                  color: Colors.lightBlueAccent),
            ],
          ),
        ),
      ],
    ));
  }
}
