import 'package:flutter/material.dart';
import 'package:medlink/constants/space_values.dart';
import 'package:medlink/view/customer/search/search_item_card.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                      Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 2.3.h,
                      ),
                      Spaces.x2,
                      Text(
                        "Doctor",
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      )
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
