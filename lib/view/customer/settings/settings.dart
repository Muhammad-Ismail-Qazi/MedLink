import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/space_values.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var toggle1 = true;
  var toggle2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 90.w,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text("Ayarlar",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spaces.y4,
                  const Text("Hesab ayarları",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 2.7.h,
                      child: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text("Şifrəni yenilə"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 2.2.h,
                    ),
                  ),
                  Spaces.y2,
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade900,
                      radius: 2.7.h,
                      child: const Icon(
                        Icons.notification_add,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text("Şifrəni yenilə"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 2.2.h,
                    ),
                  ),
                  Spaces.y2,
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      radius: 2.7.h,
                      child: const Icon(
                        CupertinoIcons.graph_circle_fill,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text("Şifrəni yenilə"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 2.2.h,
                    ),
                  ),
                  Spaces.y2,
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade800,
                      radius: 2.7.h,
                      child: const Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text("Şifrəni yenilə"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 2.2.h,
                    ),
                  ),
                  Spaces.y3,
                  const Text("Daha ətraflı",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Spaces.y1,
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 2.7.h,
                      child: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text("Şifrəni yenilə"),
                    trailing: Switch(
                      activeTrackColor: Colors.lightBlueAccent,
                      inactiveTrackColor: Colors.white,
                      value: toggle1,
                      onChanged: (val) {
                        setState(() {
                          toggle1 = val;
                        });
                      },
                    ),
                  ),
                  Spaces.y2,
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade900,
                      radius: 2.7.h,
                      child: const Icon(
                        Icons.notification_add,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text("Şifrəni yenilə"),
                    trailing: Switch(
                      activeTrackColor: Colors.lightBlueAccent,
                      inactiveTrackColor: Colors.white,
                      value: toggle2,
                      onChanged: (val) {
                        setState(() {
                          toggle2 = val;
                        });
                      },
                    ),
                  ),
                  Spaces.y2,
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      radius: 2.7.h,
                      child: const Icon(
                        CupertinoIcons.graph_circle_fill,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text("Valuta"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.power,
                          color: Colors.grey,
                          size: 1.7.h,
                        ),
                        Spaces.x0,
                        Text.rich(TextSpan(
                            text: "AZN",
                            style:
                                TextStyle(fontSize: 9.sp, color: Colors.grey),
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.grey,
                                  size: 2.2.h,
                                ),
                              ),
                            ])),
                      ],
                    ),
                  ),
                  Spaces.y2,
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade800,
                      radius: 2.7.h,
                      child: const Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text("Bağlantılar"),
                    trailing: Text.rich(TextSpan(
                        text: "Facebook, Google",
                        style: TextStyle(fontSize: 9.sp, color: Colors.grey),
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey,
                              size: 2.2.h,
                            ),
                          ),
                        ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
