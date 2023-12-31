// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/space_values.dart';
import '../../../widgets/custom_button.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key});

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
                        Spaces.x4,
                        Text("Doctor Details",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold)),
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
                Spaces.y3,
                Card(
                  elevation: 0.3,
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80",
                                  width: 25.w,
                                  height: 10.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Spaces.x2,
                            Flexible(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Dr. Nigar",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 2.h,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Kardioloq",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Spaces.y0,
                                  Text(
                                    "7 illik tacruba",
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.grey),
                                  ),
                                  Spaces.y1_0,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RatingBar.builder(
                                          initialRating: 3,
                                          itemSize: 2.h,
                                          minRating: 1,

                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          // itemPadding: EdgeInsets.symmetric(
                                          //     horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 2.h,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(CupertinoIcons.power,
                                                color: Colors.lightBlue,
                                                size: 2.h),
                                            Spaces.x1,
                                            Flexible(
                                              child: Text("28.00/saat",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.grey,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spaces.y1,
                        CustomElevatedButton(
                            buttonText: "Oeydiyyat ol",
                            backgroundColor: Colors.lightBlue.shade200,
                            textColor: Colors.white,
                            width: 40.w,
                            onPressed: () {
                              Get.toNamed('/appt_screen');
                            },
                            color: Colors.lightBlue.shade200),
                      ],
                    ),
                  ),
                ),
                Spaces.y1,
                Container(
                  width: 80.w,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Spaces.x2,
                      const Expanded(
                        child: cardwidget(title: "100", sub: "Bitirilmis"),
                      ),
                      const Expanded(
                        child: cardwidget(title: "500", sub: "Qeydiyyatda"),
                      ),
                      const Expanded(
                        child: cardwidget(title: "600", sub: "Umumi"),
                      ),
                      Spaces.x2,
                    ],
                  ),
                ),
                Spaces.y2,
                SizedBox(
                  width: 80.w,
                  child: const Text(
                    "Dr.Nazia geniş spektrli sağlamlıq problemləri üçün diaqnostika və müalicə təklif edən hərtərəfli ümumi tibbi yardım göstərir. O, müntəzəm müayinələr, sağlamlıq məsləhətləri və xroniki vəziyyətlərin idarə edilməsi istəyən xəstələr üçün əsas əlaqə nöqtəsi kimi xidmət edir.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Spaces.y4,
                SizedBox(
                  width: double.infinity,
                  child: Text("Xidmetierimiz",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                for (int i = 1; i < 4; i++)
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "$i. ",
                          style: const TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                            text:
                                "Xasta qaygisi bir nomreli prioritetimizdir. ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ])),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class cardwidget extends StatelessWidget {
  const cardwidget({
    super.key,
    required this.title,
    required this.sub,
  });
  final String title;
  final String sub;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.5.w),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey.shade100),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
            FittedBox(fit: BoxFit.scaleDown, child: Text(sub)),
          ],
        ));
  }
}
