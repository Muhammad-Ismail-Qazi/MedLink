import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/controller/signup_controller.dart';
import 'package:medlink/view/customer/home/liked_card.dart';
import 'package:medlink/view/customer/home/popular_card.dart';
import 'package:sizer/sizer.dart';
import '../../../Constants/space_values.dart';
import '../../../controller/home_screen_controller.dart';
import '../../../controller/login_controller.dart';
import '../../../model/signup_model.dart';
import '../../../widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  LoginController loginController = Get.put(LoginController());
  List images = [
    "assets/images/eye.png",
    "assets/images/heart.png",
    "assets/images/slim.png",
    "assets/images/tooth.png",
    "assets/images/heart.png",
    "assets/images/slim.png",
    "assets/images/tooth.png",
  ];
  String? userName;
  String? profilePictureUrl;
  final HomeScreenController _homeScreenController = HomeScreenController();
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    super.dispose();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    UserModel? userData = await _homeScreenController.getCurrentUserData();
    if (userData != null) {
      setState(() {
        userName = userData.username;
        profilePictureUrl = userData.profilePictureURL;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState,
        drawer: DrawerWidget(mounted: mounted, scaffoldState: _scaffoldState),
        body: Stack(
          children: [
            // Circular gradient on top left
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 90.w,
                height: 70.h,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topLeft,
                    colors: [
                      Colors.lightBlue.shade100,
                      Colors.lightBlue.shade50,
                      Colors.white
                    ],
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
                    colors: [
                      Colors.green.shade100,
                      Colors.green.shade50,
                      Colors.white
                    ],
                    radius: 1.0,
                  ),
                ),
              ),
            ),
            Container(
              height: 20.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.lightBlue.shade200,
                    Colors.lightBlue.shade200,
                    Colors.teal.shade200
                  ], // Define your gradient colors
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _scaffoldState.currentState?.openDrawer();
                        },
                        child: const Icon(
                          Icons.menu_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Spaces.y1,
                      Text("Salam",
                          style:
                          TextStyle(color: Colors.white, fontSize: 16.sp)),
                      // Obx(() {
                      //   return
                          Text(userName ?? '',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold)),
                      // })

                    ],
                  ),
                  CircleAvatar(
                    radius: 4.h,
                    backgroundImage: profilePictureUrl != null
                        ? NetworkImage(profilePictureUrl!)
                        : null,
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    height: 78.h,
                    width: 95.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spaces.y3,
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: TextFormField(
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
                        ),
                        Spaces.y1,
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Qeydiyyat",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spaces.y2,
                                SizedBox(
                                  height: 16.h,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 25.w,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                            color: Colors.lightBlue.shade200,
                                          ),
                                          margin: EdgeInsets.only(right: 3.w),
                                        );
                                      }),
                                ),
                                Spaces.y4,
                                SizedBox(
                                  height: 10.h,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 7,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final randomColor = _getRandomColor();
                                        return Container(
                                          width: 22.w,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                randomColor.withOpacity(1),
                                                randomColor.withOpacity(0.9),
                                                randomColor.withOpacity(0.8),
                                              ], // Define your gradient colors
                                            ),
                                          ),
                                          margin: EdgeInsets.only(right: 2.5.w),
                                          child: Image.asset(
                                            images[index],
                                          ),
                                        );
                                      }),
                                ),
                                Spaces.y3,
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Secilmis hakimler",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4.w),
                                      child: Text.rich(
                                        TextSpan(
                                            text: "Hamisi",
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.grey),
                                            children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 1.5.h,
                                                    color: Colors.grey,
                                                  ))
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                                Spaces.y2,
                                CarouselSlider.builder(
                                  itemCount: 4,
                                  itemBuilder: (c, index, realIndex) {
                                    return const PopularCard();
                                  },
                                  options: CarouselOptions(
                                      padEnds: false,
                                      enlargeCenterPage: false,
                                      autoPlay: false,
                                      enableInfiniteScroll: false,
                                      // aspectRatio: 16 / 9,
                                      initialPage: 0,
                                      viewportFraction: 0.45),
                                ),
                                Spaces.y3,
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Yeni hekimler",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4.w),
                                      child: Text.rich(
                                        TextSpan(
                                            text: "Hamisi",
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.grey),
                                            children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 1.5.h,
                                                    color: Colors.grey,
                                                  ))
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                                Spaces.y2,
                                CarouselSlider.builder(
                                  itemCount: 4,
                                  itemBuilder: (c, index, realIndex) {
                                    return const LikedDoctorsCard();
                                  },
                                  options: CarouselOptions(
                                      padEnds: false,
                                      enlargeCenterPage: false,
                                      autoPlay: false,
                                      enableInfiniteScroll: false,
                                      aspectRatio: 15 / 7,
                                      initialPage: 0,
                                      viewportFraction: 0.4),
                                ),
                                Spaces.y1,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))),
          ],
        ));
  }

  Color _getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );
  }
}
