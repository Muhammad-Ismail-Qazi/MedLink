import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../constants/space_values.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final textFieldController = TextEditingController();
  final getArgs = Get.arguments;
  String title = "";
  @override
  void initState() {
    super.initState();
    title = getArgs["title"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Spaces.y6,
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5.w),
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
                Text("Hesab",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 80.h,
              width: 90.w,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Spaces.y2,
                      TextFormField(
                        controller: textFieldController,
                        decoration: const InputDecoration(
                            // hintText: "Bura daxil olun",
                            // hintStyle: TextStyle(color: Colors.white),
                            // enabledBorder: InputBorder.none,
                            // focusedBorder: InputBorder.none,
                            ),
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
