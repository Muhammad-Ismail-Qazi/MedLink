import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/space_values.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
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
        Center(
          child: SizedBox(
            height: 98.h,
            width: 90.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Spaces.y4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  Spaces.y1,
                  Card(
                    elevation: 0.3,
                    margin: EdgeInsets.only(top: 1.h),
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                      child: Row(children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 4.5.h,
                              backgroundImage: const NetworkImage(
                                  "https://picsum.photos/200"),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 5,
                              child: InkWell(
                                child: CircleAvatar(
                                  radius: 1.4.h,
                                  backgroundColor:
                                      Colors.lightBlueAccent.shade100,
                                  child: Icon(
                                    CupertinoIcons.camera,
                                    color: Colors.white,
                                    size: 1.3.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spaces.x3,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. Nigar",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Kardioloq",
                              style: TextStyle(
                                color: Colors.lightBlueAccent.shade100,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Card(
                        margin: EdgeInsets.only(bottom: 1.h),
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  CupertinoIcons.mail,
                                  color: Colors.lightBlueAccent.shade100,
                                  size: 3.h,
                                ),
                                const Text(
                                  "nigarmajidova92@gmail.com",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ]),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  CupertinoIcons.phone_fill,
                                  color: Colors.lightBlueAccent.shade100,
                                  size: 3.h,
                                ),
                                const Text(
                                  "+994 55 209 08 18",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ]),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  CupertinoIcons.bag_fill,
                                  color: Colors.lightBlueAccent.shade100,
                                  size: 3.h,
                                ),
                                const Text(
                                  "12 il təcrübə",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ]),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  CupertinoIcons.money_dollar,
                                  color: Colors.lightBlueAccent.shade100,
                                  size: 3.h,
                                ),
                                const Text(
                                  "\$83",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Spaces.y1,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Haqqında",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 2.h,
                      ),
                    ],
                  ),
                  Spaces.y1,
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Spaces.y1,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ali təhsil",
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Azərbaycan tibb universiteti Medipol Universiteti",
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.edit,
                        size: 3.h,
                        color: Colors.lightBlueAccent.shade100,
                      ),
                    ],
                  ),
                  Spaces.y3,
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Spaces.y1,
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Çalışdığı klinika ",
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Flexible(
                              child: Text(
                                "Baku Medical",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 2.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spaces.y1,
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Spaces.y1,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Qeydiyyat saatları ",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                      Icon(
                        Icons.edit,
                        size: 3.h,
                        color: Colors.lightBlueAccent.shade100,
                      ),
                    ],
                  ),
                  Spaces.y1,
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
