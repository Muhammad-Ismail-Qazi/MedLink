import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/space_values.dart';

// ignore: must_be_immutable
class EditHospital extends StatefulWidget {
  const EditHospital({super.key});

  @override
  State<EditHospital> createState() => _EditHospitalState();
}

class _EditHospitalState extends State<EditHospital> {
  List<bool> selections = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

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
            height: 90.h,
            width: 90.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    color: Colors.white,
                    child: Row(
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
                        Expanded(
                          child: Center(
                            child: Text("Notifikasiyalar",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: hospitals.length,
                      itemBuilder: (c, index) {
                        return Container(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(vertical: 1.h),
                          child: CheckboxListTile.adaptive(
                              title: Text(hospitals[index]),
                              value: selections[index],
                              onChanged: (val) {
                                setState(() {
                                  selections[index] = val!;
                                });
                              }),
                        );
                      }),
                  Spaces.y1,
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }

  List hospitals = [
    'Modern hospital',
    'Baku medical',
    'Biomed spektr',
    'Memorial',
    '6 saylı uşaq poliklinikasl',
    'Yeni nəsil klinikası',
    '12 saylı poliklinika',
  ];
}
