import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlink/controller/media_controlller.dart';
import 'package:medlink/model/image_model.dart';
import 'package:medlink/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/space_values.dart';

class AddRecordTwo extends StatefulWidget {
  const AddRecordTwo({super.key});

  @override
  State<AddRecordTwo> createState() => AddRecordTwoState();
}

class AddRecordTwoState extends State<AddRecordTwo> {
  int selectedColumn = 0;
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
            height: 40.h,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.bottomRight,
                colors: [
                  Colors.green.shade200,
                  Colors.green.shade100,
                  Colors.white
                ],
                radius: 1.0,
              ),
            ),
          ),
        ),
        Positioned(
          top: 5.h,
          child: Row(
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
              Text("Qeydiyyat əlavə et",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
            ],
          ),
        ),

        Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Text(
              //   "Qeydiyyat əlavə et.",
              //   style: TextStyle(
              //     fontSize: 13.sp,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),

              Spaces.y4,
              Container(
                height: 55.h,
                padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
                child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: mediaController.imgPaths.isNotEmpty
                        ? mediaController.imgPaths.length + 1
                        : 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2.h,
                        crossAxisSpacing: 2.h),
                    itemBuilder: (ctx, index) {
                      if (index < mediaController.imgPaths.length) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.file(
                              File(mediaController.imgPaths[index].imgUrl),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        if (mediaController.imgPaths.length == index ||
                            mediaController.imgPaths.isEmpty) {
                          return GestureDetector(
                            onTap: () async {
                              await pickImage();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightGreenAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              height: double.infinity,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.lightBlue,
                                    size: 5.h,
                                  ),
                                  Spaces.y1,
                                  const Text("Şəkil \nəlavə et",
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Colors.lightBlue)),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }
                    }),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12, // Shadow color
                  offset: Offset(0, 0), // Offset the shadow upwards
                  blurRadius: 10, // Spread of the shadow
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Qeydiyyat et"),
                        Spaces.y0,
                        Text(
                          "Nigar  Majidova",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit, color: Colors.grey))
                  ],
                ),
                Spaces.y3,
                const Text("Qeyd növü"),
                Spaces.y1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnItem(
                      icon: Icons.description,
                      label: "Hesabat",
                      isSelected: selectedColumn == 0,
                      onPressed: () {
                        setState(() {
                          selectedColumn = 0;
                        });
                      },
                    ),
                    ColumnItem(
                      icon: Icons.receipt,
                      label: "Resept",
                      isSelected: selectedColumn == 1,
                      onPressed: () {
                        setState(() {
                          selectedColumn = 1;
                        });
                      },
                    ),
                    ColumnItem(
                      icon: CupertinoIcons.doc_person_fill,
                      label: "Faktura",
                      isSelected: selectedColumn == 2,
                      onPressed: () {
                        setState(() {
                          selectedColumn = 2;
                        });
                      },
                    ),
                  ],
                ),
                Spaces.y3,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Qeyd yaradıldı"),
                        Spaces.y0,
                        Text(
                          "23 Sentyabr, 2023",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit, color: Colors.grey))
                  ],
                ),
                Spaces.y5,
                Center(
                  child: CustomElevatedButton(
                      buttonText: "Əlavə et",
                      backgroundColor: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      width: 80.w,
                      height: 6.5.h,
                      onPressed: () {},
                      color: Colors.lightBlueAccent),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  pickImage() {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.5.h,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Spaces.y1,
          Container(
            width: 35.w,
            height: 0.5.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10.0)),
          ),
          Spaces.y3,
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 3.w),
            child: Text(
              "Qeydiyyat əlavə et.",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spaces.y2,
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 3.w),
            child: GestureDetector(
              onTap: () async {
                try {
                  var path =
                      await mediaController.pickImage(ImageSource.camera);
                  mediaController.imgPaths
                      .add(ImageModel(imgUrl: path, caption: ""));
                  Get.back();
                  setState(() {});
                } catch (e) {
                  log("Exception:: $e");
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
                  Spaces.x2,
                  const Text(
                    "Şəkil çək",
                  ),
                ],
              ),
            ),
          ),
          Spaces.y2,
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 3.w),
            child: GestureDetector(
              onTap: () async {
                try {
                  var path =
                      await mediaController.pickImage(ImageSource.gallery);
                  mediaController.imgPaths
                      .add(ImageModel(imgUrl: path, caption: ""));
                  Get.back();
                  setState(() {});
                } catch (e) {
                  log("Exception:: $e");
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.photo,
                    color: Colors.grey,
                  ),
                  Spaces.x2,
                  const Text(
                    "Qalereyadan əlavə et",
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class ColumnItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  ColumnItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Colors.lightBlue : Colors.grey;

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 4.h,
          ),
          Text(
            label,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
