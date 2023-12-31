import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/space_values.dart';
import '../../../controller/media_controlller.dart';
import '../../../widgets/custom_button.dart';

class OrderMedicine extends StatefulWidget {
  const OrderMedicine({super.key});

  @override
  State<OrderMedicine> createState() => OrderMedicineState();
}

class OrderMedicineState extends State<OrderMedicine> {
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
              Text("Dərman sifarişləri",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
            ],
          ),
        ),

        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 14.h,
                  backgroundColor: Colors.greenAccent.withOpacity(0.2),
                  child: Image.asset("assets/images/doc.png")),
              Spaces.y4,
              Text(
                "Sifariş yoxdur",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spaces.y1,
              const Text(
                "Sifariş əlavə edin",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              Spaces.y4,
              CustomElevatedButton(
                  buttonText: "Sifariş et",
                  backgroundColor: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  width: 80.w,
                  height: 6.5.h,
                  onPressed: () {
                    pickImage();
                  },
                  color: Colors.lightBlueAccent),
            ],
          ),
        ),
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
                  await mediaController.pickImage(ImageSource.camera);

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
                  await mediaController.pickImage(ImageSource.gallery);

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
          Spaces.y2,
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 3.w),
            child: GestureDetector(
              onTap: () async {
                try {
                  await mediaController.pickFile();

                  setState(() {});
                } catch (e) {
                  log("Exception:: $e");
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.description,
                    color: Colors.grey,
                  ),
                  Spaces.x2,
                  const Text(
                    "Sənədlərdən əlavə edin",
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
