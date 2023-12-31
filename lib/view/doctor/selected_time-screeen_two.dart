import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';

class SelectTimeScreenTwo extends StatefulWidget {
  const SelectTimeScreenTwo({super.key});

  @override
  State<SelectTimeScreenTwo> createState() => _SelectTimeScreenTwoState();
}

class _SelectTimeScreenTwoState extends State<SelectTimeScreenTwo> {
  List<String> options = ['Bu gun, 23 Sen,', 'Sabah, 24 Sen', 'B.e gunu'];
  List<String> optionSub = ['Masguldur,', '9 uygun gun', '10 uyoun gun'];
  List<String> time = [
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
  ];
  int selectedIndex = 0;
  int timeIndex = 0;
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
              width: 90.w,
              height: 98.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spaces.y4,
                  // Back button
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
                      Text("Saat seçin",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spaces.y3,
                  //top card
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
                                  mainAxisSize: MainAxisSize.min,
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
                                    Spaces.y1_0,
                                    Row(
                                      children: [
                                        const Expanded(child: Text("87%")),
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
                                    ),
                                    Spaces.y2,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spaces.y3,

                  Flexible(
                      child: SizedBox(
                    height: 7.h,
                    child: ListView.builder(
                        itemCount: options.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex =
                                      index; // Update the selected index
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  backgroundColor: selectedIndex == index
                                      ? Colors.lightBlue.shade200
                                      : Colors
                                          .white, // Change color based on selection
                                  surfaceTintColor: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(options[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                        color: selectedIndex != index
                                            ? Colors.lightBlue
                                            : Colors.white,
                                      )),
                                  Text(optionSub[index],
                                      style: TextStyle(
                                        color: selectedIndex != index
                                            ? Colors.lightBlue
                                            : Colors.white,
                                      )),
                                ],
                              ),
                            ),
                          );
                        }),
                  )),
                  Spaces.y3,
                  Text(
                    "Bu gun, 23 Sentybar",
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spaces.y10,
              Spaces.y10,
              Spaces.y5,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  textAlign: TextAlign.start,
                  "Günorta 7 uyğun saat",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Flexible(
                    child: SizedBox(
                  height: 7.h,
                  child: ListView.builder(
                      itemCount: time.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                timeIndex = index; // Update the selected index
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                backgroundColor: timeIndex == index
                                    ? Colors.lightBlue.shade200
                                    : const Color(
                                        0xff61CEFF), // Change color based on selection
                                surfaceTintColor: Colors.white),
                            child: Text(time[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: timeIndex != index
                                      ? Colors.lightBlue
                                      : Colors.white,
                                )),
                          ),
                        );
                      }),
                )),
              ),
              Spaces.y3,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  textAlign: TextAlign.start,
                  "Axşam 2 uyğun saat",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Flexible(
                    child: SizedBox(
                  height: 7.h,
                  child: ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                timeIndex = index; // Update the selected index
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                backgroundColor: timeIndex == index
                                    ? Colors.lightBlue.shade200
                                    : const Color(
                                        0xff61CEFF), // Change color based on selection
                                surfaceTintColor: Colors.white),
                            child: Text(time[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: timeIndex != index
                                      ? Colors.lightBlue
                                      : Colors.white,
                                )),
                          ),
                        );
                      }),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
