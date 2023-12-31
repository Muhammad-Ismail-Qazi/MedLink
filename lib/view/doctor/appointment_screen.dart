import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlink/controller/appointment_controller.dart';
import 'package:medlink/controller/doctor_controller.dart';
import 'package:medlink/controller/media_controlller.dart';
import 'package:medlink/model/image_model.dart';
import 'package:medlink/view/doctor/select_time_screen.dart';
import 'package:medlink/widgets/custom_textfield.dart';
import 'package:sizer/sizer.dart';
import '../../constants/space_values.dart';
import '../../widgets/custom_button.dart';

class AppointMentScreen extends StatefulWidget {
  const AppointMentScreen({super.key});

  @override
  State<AppointMentScreen> createState() => _AppointMentScreenState();
}

///--------------------------------------------
///GET DOCTOR FROM THE PREVIOUS SCREEN LATER ON.
///FOR NOW WE ARE USING THE FIRST DOCTOR FROM
///DOCTOR'S LIST. BREAKPOINTS ARE ADDED WHERE
///CHANGE IS REQUIRED.
///--------------------------------------------

class _AppointMentScreenState extends State<AppointMentScreen> {
  final controller = Get.find<DoctorController>();
  final mediaController = Get.find<MediaController>();
  final appointmentController = Get.find<AppointmentController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
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
                                    child: Obx(
                                      () => Image.network(
                                        controller.allDoctors.isNotEmpty
                                            ? controller.allDoctors.first.imgUrl
                                            : "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg",
                                        width: 25.w,
                                        height: 10.h,
                                        fit: BoxFit.cover,
                                      ),
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
                                          Obx(
                                            () => Text(
                                              controller.allDoctors.isNotEmpty
                                                  ? controller
                                                      .allDoctors.first.name
                                                  : '-',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 2.h,
                                          ),
                                        ],
                                      ),
                                      Obx(
                                        () => Text(
                                          controller.allDoctors.isNotEmpty
                                              ? controller
                                                  .allDoctors.first.designation
                                              : '-',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Spaces.y1_0,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(child: Text("87%")),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(CupertinoIcons.power,
                                                    color: Colors.lightBlue,
                                                    size: 2.h),
                                                Spaces.x1,
                                                Obx(
                                                  () => Flexible(
                                                    child: Text(
                                                        "${controller.allDoctors.isNotEmpty ? controller.allDoctors.first.rates : 0}/saat",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Colors.grey,
                                                        )),
                                                  ),
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
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomMultilineTextField(
                            onTextChange: (val) {},
                            height: 6.5.h,
                            hint: 'Pasientin adı',
                            initialValue: appointmentController.nameController,
                            textInputType: TextInputType.name,
                            textCapitlization: TextCapitalization.words,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                          ),
                          Spaces.y2, //contact no.
                          CustomMultilineTextField(
                            onTextChange: (val) {},
                            height: 6.5.h,
                            hint: 'Əlaqə nömrəsi',
                            textInputType: TextInputType.phone,
                            initialValue:
                                appointmentController.contactController,
                            textCapitlization: TextCapitalization.none,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
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
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showbottomsheet();
                                },
                                child: Container(
                                  width: 25.w,
                                  height: 15.h,
                                  margin: EdgeInsets.only(
                                      bottom: 1.5.h, right: 3.w),
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
                              Expanded(
                                child: SizedBox(
                                  height: 20.h,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemCount:
                                          mediaController.imgPaths.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
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
                                ),
                              ),
                            ],
                          ),

                          Spaces.y1,
                          Center(
                            child: CustomElevatedButton(
                                height: 6.h,
                                buttonText: "Novbeti",
                                backgroundColor: Colors.lightBlue.shade200,
                                textColor: Colors.white,
                                width: 80.w,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (mediaController.imgPaths.isNotEmpty) {
                                      Get.to(SelectTimeScreen(
                                        doctor: controller.allDoctors.first,
                                      ));
                                    } else {
                                      Get.showSnackbar(const GetSnackBar(
                                        title: "Attention",
                                        message:
                                            "Please upload atleast 1 picture",
                                        isDismissible: true,
                                      ));
                                    }
                                  }
                                },
                                color: Colors.lightBlue.shade200),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    ));
  }

  showbottomsheet() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.only(bottom: 1.5.h, left: 2.w, right: 2.w),
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.5.h,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onTap: () async {
              try {
                var path = await mediaController.pickImage(ImageSource.camera);
                if (path.isNotEmpty) {
                  Get.to(imageholderWidget(path: path));
                }
                setState(() {});
              } catch (e) {
                if (kDebugMode) {
                  print("Exception:: $e");
                }
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
                var path = await mediaController.pickImage(ImageSource.gallery);
                if (path.isNotEmpty) {
                  Get.to(imageholderWidget(path: path));
                }

                setState(() {});
              } catch (e) {
                if (kDebugMode) {
                  print("Exception:: $e");
                }
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 3.5.h,
                  backgroundColor: Colors.purple,
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
