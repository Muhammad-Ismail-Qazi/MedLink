import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medlink/constants/space_values.dart';
import 'package:medlink/view/search/search_item_card.dart';
import 'package:sizer/sizer.dart';

import '../registration/login_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                      Text("Doctor",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spaces.y3,
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Search here",
                        prefixIcon: Icon(
                          Icons.search,
                          size: 2.3.h,
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.close,
                          size: 2.h,
                          color: Colors.grey,
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 2.h,
                          horizontal: 1.w,
                        )),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (c, index) {
                        return const SearchItemCard();
                      }),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

//templete
// return Scaffold(
//         body: Stack(
//       children: [
//         // Circular gradient on top left
//         Align(
//           alignment: Alignment.topLeft,
//           child: Container(
//             width: 90.w,
//             height: 50.h,
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 center: Alignment.topLeft,
//                 colors: [Colors.lightBlue.shade100, Colors.white],
//                 radius: 1.0,
//               ),
//             ),
//           ),
//         ),
//         // Circular gradient on bottom right
//         Align(
//           alignment: Alignment.bottomRight,
//           child: Container(
//             width: 80.w,
//             height: 50.h,
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 center: Alignment.bottomRight,
//                 colors: [Colors.green.shade100, Colors.white],
//                 radius: 1.0,
//               ),
//             ),
//           ),
//         ),
//        ],
//     ));
