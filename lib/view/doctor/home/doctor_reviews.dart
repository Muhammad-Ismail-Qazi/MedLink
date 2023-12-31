import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/space_values.dart';

class DoctorReviews extends StatelessWidget {
  const DoctorReviews({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spaces.y4,
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
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
                      Text("Notifikasiyalar",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold)),
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
                              Spaces.x4,
                              Flexible(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr. Nigar",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spaces.y0,
                                    Text(
                                      "Kardioloq",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Spaces.y0,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RatingBar.builder(
                                            initialRating: 4,
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
                                          child: Text("4.9 (150)",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.grey,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Spaces.y1,
                        ],
                      ),
                    ),
                  ),
                  Spaces.y1,
                  SizedBox(
                    width: 85.w,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 3.h,
                          ),
                          margin: EdgeInsets.symmetric(
                            // horizontal: 3.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xFF82D7E3),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: [
                              Text(
                                "Bütün rəylər",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Spaces.y0,
                              Text(
                                "12,656",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        )),
                        Spaces.x5,
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 3.h,
                          ),
                          margin: EdgeInsets.symmetric(
                            // horizontal: 3.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xFF82D7E3),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: [
                              Text(
                                "Bütün qeydiyatlar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Spaces.y0,
                              Text(
                                "35",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  Spaces.y1,
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 1.w,
                          children: List.generate(5, (index) {
                            return const Icon(
                              CupertinoIcons.star_fill,
                              color: Colors.amber,
                            );
                          }),
                        ),
                      ),
                      const Text(
                        '600',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 1.w,
                          children: List.generate(5, (index) {
                            return index <= 3
                                ? const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.amber,
                                  )
                                : const Icon(
                                    CupertinoIcons.star,
                                    color: Colors.grey,
                                  );
                          }),
                        ),
                      ),
                      const Text(
                        '30',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 1.w,
                          children: List.generate(5, (index) {
                            return index <= 2
                                ? const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.amber,
                                  )
                                : const Icon(
                                    CupertinoIcons.star,
                                    color: Colors.grey,
                                  );
                          }),
                        ),
                      ),
                      const Text(
                        '19',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 1.w,
                          children: List.generate(5, (index) {
                            return index <= 1
                                ? const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.amber,
                                  )
                                : const Icon(
                                    CupertinoIcons.star,
                                    color: Colors.grey,
                                  );
                          }),
                        ),
                      ),
                      const Text(
                        '9',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 1.w,
                          children: List.generate(5, (index) {
                            return index == 0
                                ? const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.amber,
                                  )
                                : const Icon(
                                    CupertinoIcons.star,
                                    color: Colors.grey,
                                  );
                          }),
                        ),
                      ),
                      const Text(
                        '3',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Spaces.y3,
                  Text("Son rəylər",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 14.sp)),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed('/docter_detail');
                          },
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 1.w),
                          leading: CircleAvatar(
                            radius: 4.h,
                            backgroundImage: const NetworkImage(
                                "https://picsum.photos/200/300"),
                          ),
                          title: Text(
                            "Pasient",
                            style: TextStyle(fontSize: 18..sp),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: RatingBar.builder(
                                      initialRating: 4,
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
                                  Text("4.9 (150)",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              const Text("Sevimli həkimim .........."),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
