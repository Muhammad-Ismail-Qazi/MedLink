import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/space_values.dart';

class AllRecords extends StatefulWidget {
  const AllRecords({super.key});

  @override
  State<AllRecords> createState() => _AllRecordsState();
}

class _AllRecordsState extends State<AllRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 90.w,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Spaces.y5,
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
                        Text("Pasient Malumatlari",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Spaces.y4,
                    for (int i = 0; i < 4; i++) const RecordWidget(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecordWidget extends StatelessWidget {
  const RecordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 13.w,
                  // height: 7.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.lightBlueAccent,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                  child: const Text("26\nMart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Spaces.y0,
                Container(
                  alignment: Alignment.center,
                  width: 13.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.lightGreenAccent.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: const Text("Yeni",
                      style: TextStyle(color: Colors.lightBlue)),
                )
              ],
            ),
          ),
          Spaces.x3,
          Expanded(
            flex: 4,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Əlavə etdiyiniz qeyd",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Spaces.y0,
                  Text("Nigar Məcidova üçün qeyd",
                      style:
                          TextStyle(fontSize: 10.sp, color: Colors.lightBlue)),
                  Spaces.y1,
                ],
              ),
              subtitle: Text("1 Sənəd", style: TextStyle(fontSize: 9.sp)),
            ),
          ),
          InkWell(onTap: () {}, child: Icon(Icons.more_vert)),
        ],
      ),
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Flexible(
      //       flex: 1,
      //       child:  ),
      //     Spaces.x3,
      //     Flexible(
      //       flex: 3,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         // mainAxisSize: MainAxisSize.min,
      //         children: [
      //           const Text("Əlavə etdiyiniz qeyd",
      //               style: TextStyle(fontWeight: FontWeight.bold)),
      //           Spaces.y0,
      //           Text("Nigar Məcidova üçün qeyd",
      //               style: TextStyle(fontSize: 10.sp, color: Colors.lightBlue)),
      //           Spaces.y2,
      //           Text("1 Sənəd", style: TextStyle(fontSize: 9.sp)),
      //         ],
      //       ),
      //     ),
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      //   ],
      // ),
    );
  }
}
