import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/space_values.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade100,
          blurRadius: 3,
          spreadRadius: 2,
          offset: const Offset(-5, 0), // Shadow on the left
        ),
        BoxShadow(
          color: Colors.grey.shade100,
          blurRadius: 3,
          spreadRadius: 2,
          offset: const Offset(7, 0), // Shadow on the right
        ),
        BoxShadow(
          color: Colors.grey.shade100,
          blurRadius: 3,
          spreadRadius: 2,
          offset: const Offset(0, 7), // Shadow on the bottom
        ),
      ], borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      margin: EdgeInsets.only(right: 2.w, bottom: 1.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                "https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Spaces.y1,
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      "Dr. Fidan Agayeva",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                // Spaces.y1,
                const Text(
                  "Terapevt",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  child: RatingBar.builder(
                    initialRating: 3,
                    itemSize: 1.7.h,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
