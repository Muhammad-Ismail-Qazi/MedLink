import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';
import '../../widgets/custom_button.dart';

class DiagonsticsTestScreenTwo extends StatefulWidget {
  const DiagonsticsTestScreenTwo({super.key});

  @override
  State<DiagonsticsTestScreenTwo> createState() =>
      _DiagonsticsTestScreenTwoState();
}

class _DiagonsticsTestScreenTwoState extends State<DiagonsticsTestScreenTwo> {
  List<String> gridImageIcon = [
    'assets/home.png',
    'assets/support.png',
    'assets/service.png',
    'assets/micro.png',
  ];
  List<String> gridText = [
    ' Xidmətlər',
    ' Labaratoriya',
    ' 24-72 saat ərzində e-hesabat',
    ' Nəzarət',
  ];
  List<String> gridImage = [
    'assets/list1.png',
    'assets/list2.png',
    'assets/list3.png',
    'assets/list4.png',
  ];

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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                  Spaces.x4,
                  Text("Diaqonstika testləri",
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 10.h),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Spaces.y2,
                      Text(
                        "Evinizdə rahatlıqla sağlamlıq müayinəsindən keçin",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spaces.y1,
                      Text(
                        "45%-ə qədər endirim + 10% keşbek",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.lightBlueAccent,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GridView.count(
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 2,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        children: List.generate(gridImageIcon.length, (index) {
                          return Center(
                            child: ListTile(
                              onTap: () {},
                              leading: Image.asset(gridImageIcon[index]),
                              title: Text(gridText[index],
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    fontSize: 12.sp,
                                    color: Colors.black54,
                                  )),
                            ),
                          );
                        }),
                      ),
                      Spaces.y2,
                      Text(
                        "Sizin üçün",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spaces.y2,
                     ListView.builder(
                       physics: const NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemCount: 5,
                         itemBuilder: (context, index) {
                           return  Card(
                             surfaceTintColor: Colors.white,
                             child: Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Text(
                                     "Azərbaycanın qabaqcıl xəstəxanalarında  müayinələr",
                                     style: TextStyle(
                                       fontSize: 14.sp,
                                       fontFamily: 'Rubik',
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                   Spaces.y1,
                                   Text(
                                     "21-40 yaş arası şəxslər üçün idealdır",
                                     style: TextStyle(
                                       fontSize: 12.sp,
                                       fontFamily: 'Rubik',
                                       color: Colors.black54,
                                     ),
                                   ),
                                   Spaces.y2,
                                   OutlinedButton(
                                     style: OutlinedButton.styleFrom(
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       side: const BorderSide(color: Colors.lightBlueAccent), // Change the border color to red
                                     ),
                                     onPressed: () {},
                                     child: Text(
                                       "69 test daxildir",
                                       style: TextStyle(
                                         fontSize: 12.sp,
                                         fontFamily: 'Rubik',
                                         color: Colors.lightBlueAccent,
                                       ),
                                     ),
                                   ),
                                   Container(
                                     height: 35.h,
                                     width: double.infinity,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(12),
                                     ),
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(12),
                                       child: Image.network(

                                           'https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80',
                                           fit: BoxFit.cover),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: Row(
                                       children: [
                                         Text(
                                           "₼358",
                                           style: TextStyle(
                                             fontSize: 12.sp,
                                             fontFamily: 'Rubik',
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),
                                         Text(
                                           "35% endirim",
                                           style: TextStyle(
                                             fontSize: 10.sp,
                                             fontFamily: 'Rubik',
                                             color: Colors.lightBlueAccent,
                                           ),
                                         ),
                                         Text(
                                           "+ 10% Keşbek",
                                           style: TextStyle(
                                             fontSize: 10.sp,
                                             fontFamily: 'Rubik',
                                           ),
                                         ),
                                         Spaces.x2,
                                         CustomElevatedButton(
                                             height: 6.h,
                                             buttonText: "İndi sifariş et",
                                             backgroundColor: Colors.lightBlue.shade200,
                                             textColor: Colors.white,
                                             width: 30.w,
                                             onPressed: () {
                                               FocusScope.of(context).unfocus();
                                               Get.toNamed('/dgonstctstSc2');
                                             },
                                             color: Colors.lightBlue.shade200),
                                       ],
                                     ),
                                   )
                                 ],
                               ),
                             ),
                           );
                         },),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
