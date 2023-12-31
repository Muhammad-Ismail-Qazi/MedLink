import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlink/model/image_model.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/space_values.dart';
import '../../../controller/media_controlller.dart';
import '../../../widgets/custom_button.dart';

class AppointMentScreen extends StatefulWidget {
  const AppointMentScreen({super.key});

  @override
  State<AppointMentScreen> createState() => _AppointMentScreenState();
}

class _AppointMentScreenState extends State<AppointMentScreen> {
  final mediaController = Get.find<MediaController>();

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
            height: 30.h,
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
                    Spaces.y3,
                    Card(
                      elevation: 0.3,
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 5.w),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      ),
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
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Qeydiyyat",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spaces.y2,
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search here",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 1.w,
                          )),
                    ),
                    Spaces.y2,
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search here",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 1.w,
                          )),
                    ),
                    Spaces.y3,
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Pasient Kimdir?",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spaces.y2,
                    SizedBox(
                      height: 20.h,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: 1.5.h, left: 2.w, right: 2.w),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                      vertical: 1.5.h,
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              try {
                                                var path = await mediaController
                                                    .pickImage(
                                                        ImageSource.camera);
                                                if (path.isNotEmpty) {
                                                  Get.to(imageholderWidget(
                                                      path: path));
                                                }
                                                setState(() {});
                                              } catch (e) {
                                                log("Exception:: $e");
                                              }
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CircleAvatar(
                                                  radius: 3.5.h,
                                                  backgroundColor: Colors.pink,
                                                  child: const Icon(
                                                    Icons.camera,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Spaces.y1,
                                                const Text(
                                                  "Camera",
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spaces.x5,
                                          GestureDetector(
                                            onTap: () async {
                                              try {
                                                var path = await mediaController
                                                    .pickImage(
                                                        ImageSource.gallery);
                                                if (path.isNotEmpty) {
                                                  Get.to(imageholderWidget(
                                                      path: path));
                                                }

                                                setState(() {});
                                              } catch (e) {
                                                log("Exception:: $e");
                                              }
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CircleAvatar(
                                                  radius: 3.5.h,
                                                  backgroundColor:
                                                      Colors.purple,
                                                  child: const Icon(
                                                    Icons.photo,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Spaces.y1,
                                                const Text(
                                                  "Gallery",
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spaces.y3,
                                        ]),
                                  ),
                                );
                              },
                              child: Container(
                                width: 25.w,
                                height: 15.h,
                                margin:
                                    EdgeInsets.only(bottom: 1.5.h, right: 3.w),
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                    5.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.lightBlue.shade200,
                                      size: 8.h,
                                    ),
                                    Spaces.y1,
                                    Text("elave",
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13.sp)),
                                  ],
                                ),
                              ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: mediaController.imgPaths.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.file(
                                            File(mediaController
                                                .imgPaths[index].imgUrl),
                                            fit: BoxFit.cover,
                                            width: 25.w,
                                            height: 15.h,
                                          ),
                                        ),
                                        Spaces.y0,
                                        Text(mediaController
                                            .imgPaths[index].caption),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                    Spaces.y4,
                    Flexible(
                      child: Center(
                        child: CustomElevatedButton(
                            height: 6.h,
                            buttonText: "Novbeti",
                            backgroundColor: Colors.lightBlue.shade200,
                            textColor: Colors.white,
                            width: 80.w,
                            onPressed: () {
                              Get.toNamed('/appt_time');
                            },
                            color: Colors.lightBlue.shade200),
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    ));
  }
}

// ignore: camel_case_types
class imageholderWidget extends StatelessWidget {
  imageholderWidget({
    super.key,
    required this.path,
  });

  final String path;
  final mediaController = Get.find<MediaController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Image.file(
                File(path),
                fit: BoxFit.fitWidth,
                height: 20.h,
              ),
            ),
            TextFormField(
              style: const TextStyle(
                // Set the style for the input text
                color: Colors.white, // Set the text color to white
              ),
              controller: mediaController.caption,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                suffixIcon: InkWell(
                    onTap: () {
                      var img = ImageModel(
                        imgUrl: path,
                        caption: mediaController.caption.text.isNotEmpty
                            ? mediaController.caption.text
                            : "Me",
                      );
                      mediaController.imgPaths.add(img);
                      mediaController.caption.clear();
                      Get.offNamed('/appt_screen');
                    },
                    child: Icon(Icons.send, color: Colors.white, size: 2.h)),
                filled: false,
                hintText: "Me",
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
