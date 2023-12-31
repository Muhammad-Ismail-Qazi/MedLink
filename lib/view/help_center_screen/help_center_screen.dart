import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../Constants/space_values.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  List<String> listTextData=[
    'Yeni qeydiyyat',
    'Mövcud  qeydiyyat',
    'Onlayn konsultasiya',
    'Geri dönüş',
    'Dərman sifarişləri',
    'Diaqnostik testlər',
    'Sağlanlıq testləri',
    'Hesabım və məlumatlarım',
    'Texniki suallar',
    'Başqa problemlər',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
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
                // back button with text and search bar
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: SafeArea(
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
                              Spaces.x3,
                              InkWell(
                                onTap: () => Get.toNamed('/dgonstctstSc1'),
                                child: Text(
                                  "Yardım mərkəzi",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Spaces.y5,
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            height: 10.h,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Problemim var',
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 14.sp,
                                      fontFamily: 'Rubik',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spaces.y3,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: listTextData.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: ListTile(
                                  leading: Text(listTextData[index],
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.bold)),
                                  trailing:
                                      Icon(Icons.arrow_forward_ios_outlined),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
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
