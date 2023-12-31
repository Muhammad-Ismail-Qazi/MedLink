import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/space_values.dart';

class LikedDoctorsCard extends StatelessWidget {
  const LikedDoctorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite_border_outlined,
                  size: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 2.h,
                    ),
                    Spaces.x1,
                    const Text(
                      "3.7",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Spaces.y1,
          Flexible(
            flex: 4,
            child: CircleAvatar(
              radius: 4.h,
            ),
          ),
          Spaces.y1,
          Flexible(
            child: Text(
              "Dr. Fidan",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: Text("25.00/saat",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey,
                )),
          ),
        ]),
      ),
    );
  }
}
