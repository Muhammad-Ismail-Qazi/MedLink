import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../constants/space_values.dart';
import '../controller/home_screen_controller.dart';
import '../model/drawer_items.dart';
import '../model/signup_model.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
    required this.mounted,
    required GlobalKey<ScaffoldState> scaffoldState,
  }) : _scaffoldState = scaffoldState;

  final bool mounted;
  final GlobalKey<ScaffoldState> _scaffoldState;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? userName;
  String? profilePictureUrl;
  final HomeScreenController _homeScreenController = HomeScreenController();
  @override
  void initState() {
    super.initState();
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
    return Drawer(
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 81, 119, 158),
              Color.fromARGB(255, 71, 104, 136),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 3.h, 3.w, 5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 3.h,
                          backgroundImage: profilePictureUrl != null
                              ? NetworkImage(profilePictureUrl!)
                              : null,
                        ),
                        Spaces.x3,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Salam",
                                style: TextStyle(color: Colors.white)),
                            Text(userName ==null ?'Loading':userName.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        if (widget.mounted) {
                          widget._scaffoldState.currentState?.closeDrawer();
                        }
                      },
                      child: CircleAvatar(
                        radius: 1.5.h,
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < DrawerItems.all.length; i++)
                SizedBox(
                  width: 65.w,
                  child: ListTile(
                    focusColor: Colors.white24,
                    onTap: () {},
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                    leading: Icon(
                      DrawerItems.all[i].icon,
                      color: Colors.white,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Text(DrawerItems.all[i].title,
                          style: const TextStyle(color: Colors.white)),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 2.h),
                  ),
                ),
              const Spacer(),
              ListTile(
                onTap: () {
                  logout();
                },
                focusColor: Colors.white24,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Text("Çıxış",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logout() async {
    try {
      await FirebaseAuth.instance
          .signOut()
          .then((value) => {Get.toNamed('/lgnSc')});
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }
}