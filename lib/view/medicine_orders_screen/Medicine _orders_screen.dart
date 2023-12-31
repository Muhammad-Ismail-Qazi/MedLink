import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';


class MedicineOrdersScreen extends StatefulWidget {
  const MedicineOrdersScreen({super.key});

  @override
  State<MedicineOrdersScreen> createState() => _MedicineOrdersScreenState();
}

class _MedicineOrdersScreenState extends State<MedicineOrdersScreen> {
  List<String> gridText = [
    'Tibbi mütəxəssis',
    'Reseptlə əlaqəli məsələlər',
    'Sifariş statusu',
    'Sifariş çatdırılması',
    'Ödənişlər və Geri Ödənişlər',
    'Sifariş qaytarılır',
  ];
  List<String> gridImage = [
    'assets/list1.png',
    'assets/list2.png',
    'assets/list3.png',
    'assets/list4.png',
    'assets/list5.png',
    'assets/list6.png',
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
                        Spaces.x4,
                        Text("Dərman sifarişləri",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Spaces.y5,
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search here",
                          prefixIcon: Icon(
                            Icons.search,
                            size: 2.3.h,
                            color: Colors.grey,
                          ),
                          suffixIcon: Icon(
                            Icons.close,
                            size: 2.h,
                            color: Colors.grey,
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 1.w,
                          )),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.h,
            bottom: 0,
            left: 0,
            right: 0,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 2.w,
              children: List.generate(gridText.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed('/hlpcntrSc');
                    },
                    child: Card(
                        elevation: 3,
                        surfaceTintColor: Colors.white,
                        semanticContainer: true,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Expanded(
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xffbae2fd),
                                      radius: 14.w,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          gridImage[index],
                                          width: 8.w, // Adjust the width of the image
                                          height: 8.w, // Adjust the height of the image
                                          fit: BoxFit
                                              .cover, // You can choose how the image fits within the circular avatar
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(gridText[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontFamily: 'Rubik',
                                        fontSize: 12.sp)),
                              ]),
                        )),
                  ),
                );
              }),
            ),
          ),


        ],
      ),
    );
  }
}
