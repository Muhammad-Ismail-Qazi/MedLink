import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:get/get.dart';
import 'package:medlink/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/space_values.dart';
import '../../../widgets/custom_textfield.dart';

class DetailsForm extends StatefulWidget {
  const DetailsForm({super.key});

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  final _detailFormKey = GlobalKey<FormState>();
  var groupVal = "kisi";
  DateTime? datePicked;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Center(
            child: SizedBox(
              height: 100.h,
              width: 90.w,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spaces.y5,
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
                        Text("Pasient Malumatlari",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Spaces.y4,
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.0)),
                      child: const Row(
                        children: [
                          Text(
                            "Addim",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Add Slider",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Spaces.y4,
                    Form(
                      key: _detailFormKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 2.h, bottom: 3.h, left: 4.w, right: 4.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        -5, 0), // Shadow on the left
                                  ),
                                  BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        7, 0), // Shadow on the right
                                  ),
                                  BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 7), // Shadow on the bottom
                                  ),
                                ]),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomMultilineTextField(
                                    onTextChange: (val) {},
                                    textCapitlization: TextCapitalization.words,
                                    topTitle: "Pasientin adi",
                                    topTitleColor: Colors.black,
                                    hint: "Nigar Macidova",
                                    initialValue: TextEditingController(),
                                  ),
                                  Spaces.y2,
                                  const Text(
                                    "Yaşı",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spaces.y1,
                                  GestureDetector(
                                    onTap: () async {
                                      datePicked =
                                          await DatePicker.showSimpleDatePicker(
                                        context,
                                        titleText: "Yaşı",
                                        initialDate: DateTime(2001),
                                        firstDate: DateTime(2001),
                                        lastDate: DateTime(2090),
                                        dateFormat: "dd-MM-yy",
                                        locale: DateTimePickerLocale.en_us,
                                        looping: true,
                                      );
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 7.8.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey.shade200),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w, vertical: 2.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  datePicked == null
                                                      ? "Gün"
                                                      : datePicked!.day
                                                          .toString()
                                                          .padLeft(2, '0'),
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.grey,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spaces.x2,
                                        Expanded(
                                          child: Container(
                                            height: 7.8.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey.shade200),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w, vertical: 2.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  datePicked == null
                                                      ? "Ay"
                                                      : datePicked!.month
                                                          .toString()
                                                          .padLeft(2, '0'),
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.grey,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spaces.x2,
                                        Expanded(
                                          child: Container(
                                            height: 7.8.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey.shade200),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w, vertical: 2.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  datePicked == null
                                                      ? "il"
                                                      : datePicked!.year
                                                          .toString()
                                                          .substring(2)
                                                          .toString()
                                                          .padLeft(2, '0'),
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.grey,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spaces.y2,
                                  const Text(
                                    "Gender",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Radio(
                                              value: "kisi",
                                              groupValue: groupVal,
                                              onChanged: (val) {
                                                setState(() {
                                                  groupVal = val!;
                                                });
                                              }),
                                          const Text(
                                            "Kisi",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spaces.x5,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Radio(
                                              value: "qadin",
                                              groupValue: groupVal,
                                              onChanged: (val) {
                                                setState(() {
                                                  groupVal = val!;
                                                });
                                              }),
                                          const Text(
                                            "Qadin",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spaces.y2,
                                  CustomMultilineTextField(
                                    onTextChange: (val) {},
                                    textCapitlization: TextCapitalization.none,
                                    textInputType: TextInputType.phone,
                                    topTitle: "Mobile Number",
                                    topTitleColor: Colors.black,
                                    hint: "+99452090818",
                                    initialValue: TextEditingController(),
                                  ),
                                  Spaces.y2,
                                  CustomMultilineTextField(
                                    onTextChange: (val) {},
                                    textCapitlization: TextCapitalization.words,
                                    textInputType: TextInputType.emailAddress,
                                    topTitle: "Email",
                                    topTitleColor: Colors.black,
                                    hint: "abc@example.com",
                                    initialValue: TextEditingController(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spaces.y5,
                          CustomElevatedButton(
                              buttonText: "Davam",
                              backgroundColor: Colors.lightBlueAccent,
                              textColor: Colors.white,
                              width: 80.h,
                              height: 6.5.h,
                              onPressed: () {},
                              color: Colors.lightBlueAccent),
                        ],
                      ),
                    ),
                    Spaces.y2,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
