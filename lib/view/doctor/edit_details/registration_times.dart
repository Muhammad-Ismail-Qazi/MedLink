import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/space_values.dart';

class RegistrationTimes extends StatefulWidget {
  const RegistrationTimes({super.key});

  @override
  State<RegistrationTimes> createState() => _RegistrationTimesState();
}

class _RegistrationTimesState extends State<RegistrationTimes> {
  // Example lists for dropdowns
  List<String> degreeList = ['MD', 'PhD', 'DO', 'DDS'];
  List<String> areaList = [
    'Cardiology',
    'Neurology',
    'Orthopedics',
    'Dermatology'
  ];
  List<String> universityList = [
    'Harvard University',
    'Stanford University',
    'Johns Hopkins University',
    'University of Oxford'
  ];

  // Selected values from dropdowns
  String? selectedDegree;
  String? selectedArea;
  String? selectedUniversity;

  @override
  void initState() {
    super.initState;
    selectedDegree = degreeList[0];
    selectedArea = areaList[0];
    selectedUniversity = universityList[0];
  }

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
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
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
                      Expanded(
                        child: Center(
                          child: Text("Tibbi dərəcələrim",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  Spaces.y2,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dərəcənin Adı',
                            style: TextStyle(
                              fontSize: 13.sp,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 1.5.w),
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                      Spaces.y1,
                      DropdownButtonFormField(
                        value: selectedDegree,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white),
                        items: degreeList.map((String degree) {
                          return DropdownMenuItem(
                            value: degree,
                            child: Text(
                              degree,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDegree = value!;
                          });
                        },
                      ),
                      Spaces.y1,
                      Text(
                        'Sahə',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                      Spaces.y1,
                      DropdownButtonFormField(
                        value: selectedArea,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white),
                        items: areaList.map((String area) {
                          return DropdownMenuItem(
                            value: area,
                            child: Text(
                              area,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedArea = value!;
                          });
                        },
                      ),
                      Spaces.y1,
                      Text(
                        'Ali Təhsil',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                      Spaces.y1,
                      DropdownButtonFormField(
                        value: selectedUniversity,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white),
                        items: universityList.map((String uni) {
                          return DropdownMenuItem(
                            value: uni,
                            child: Text(
                              uni,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedUniversity = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (c, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dərəcənin Adı',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 1.5.w),
                                  child: Icon(Icons.delete,
                                      size: 4.h, color: Colors.red),
                                ),
                              ],
                            ),
                            Spaces.y1,
                            DropdownButtonFormField(
                              value: selectedDegree,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white),
                              items: degreeList.map((String degree) {
                                return DropdownMenuItem(
                                  value: degree,
                                  child: Text(
                                    degree,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedDegree = value!;
                                });
                              },
                            ),
                            Spaces.y1,
                            Text(
                              'Sahə',
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            Spaces.y1,
                            DropdownButtonFormField(
                              value: selectedArea,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white),
                              items: areaList.map((String area) {
                                return DropdownMenuItem(
                                  value: area,
                                  child: Text(
                                    area,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedArea = value!;
                                });
                              },
                            ),
                            Spaces.y1,
                            Text(
                              'Ali Təhsil',
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            Spaces.y1,
                            DropdownButtonFormField(
                              value: selectedUniversity,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white),
                              items: universityList.map((String uni) {
                                return DropdownMenuItem(
                                  value: uni,
                                  child: Text(
                                    uni,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedUniversity = value!;
                                });
                              },
                            ),
                            Spaces.y5,
                          ],
                        );
                      }),
                  Spaces.y1,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomElevatedButton(
                        buttonText: 'Yadda saxla',
                        backgroundColor: Colors.lightBlueAccent.shade100,
                        textColor: Colors.white,
                        width: 25.w,
                        onPressed: () {},
                        color: Colors.lightBlueAccent.shade100),
                    Spaces.x3,
                    CustomElevatedButton(
                        buttonText: 'Bağla',
                        backgroundColor: Colors.white,
                        textColor: Colors.grey.shade200,
                        width: 25.w,
                        onPressed: () {},
                        color: Colors.black),
                  ]),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class AddDegreeCard extends StatefulWidget {
  const AddDegreeCard({super.key});

  @override
  State<AddDegreeCard> createState() => _AddDegreeCardState();
}

class _AddDegreeCardState extends State<AddDegreeCard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
