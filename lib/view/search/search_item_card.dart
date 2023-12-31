import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';

class SearchItemCard extends StatelessWidget {
  const SearchItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/doc_detail"),
      child: Card(
        elevation: 0.3,
        margin: EdgeInsets.symmetric(vertical: 1.h),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dr. Nigar",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.bold),
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
                              fontSize: 10.sp, color: Colors.lightBlue),
                        ),
                        Text(
                          "7 illik tacruba",
                          style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                        ),
                        Spaces.y1_0,
                        Row(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.lightBlue,
                                ),
                                Spaces.x1,
                                Text("87%")
                              ],
                            ),
                            Spaces.x4,
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.orange,
                                ),
                                Spaces.x1,
                                Text("87%")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Spaces.y1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Uygun saat",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 10.sp, color: Colors.lightBlue),
                      ),
                      Text(
                        "12:00 Sabah",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                      buttonText: "Indi yazil",
                      backgroundColor: Colors.lightBlue.shade200,
                      textColor: Colors.white,
                      width: 25.w,
                      onPressed: () {},
                      color: Colors.lightBlue.shade200),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
