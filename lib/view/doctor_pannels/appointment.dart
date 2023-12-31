import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/constants/text_style.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';

class DoctorSideAppointments extends StatelessWidget {
  const DoctorSideAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              child: Column(
                children: [
                  Container(
                    height: 20.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    right: 1.w,
                                  ),
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
                              const Align(
                                alignment: Alignment.centerRight,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGdpcmwlMjAlMjBkb2N0b3IlMjBwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHx8MA%3D%3D',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 1.h),
                              child: Text(
                                'Mənim qeydiyyatlarım',
                                style: CustomFontStyle.font16ClrWt,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Qeydiyyat sorğularım",
                        style: CustomFontStyle.font16ClrB,
                      ),
                    ),
                  ),
                  TabBar(
                    indicatorColor: Colors.lightBlueAccent,
                    labelColor: Colors.lightBlueAccent,
                    labelStyle: CustomFontStyle.font12ClrGRY,
                    tabs: const <Widget>[
                      Tab(
                        text: 'Qeydiyyat sorğuları',
                      ),
                      Tab(
                        text: 'Bu günə qeydiyyatlar',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(14),
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(
                                      0), // Adjust the content padding
                                  tileColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 5.h,
                                    backgroundImage: const NetworkImage(
                                      'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGdpcmwlMjAlMjBkb2N0b3IlMjBwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHx8MA%3D%3D',
                                    ),
                                  ),
                                  title: Text("Patient 1",
                                      style: CustomFontStyle.font12ClrBlk),
                                  subtitle: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.5, // Adjust the width as needed
                                    padding: EdgeInsets.only(
                                        left: 8.0), // Adjust the padding
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Burundan qanaxma",
                                            style:
                                                CustomFontStyle.font12ClrGRY),
                                        Text("28 Okt 2023 | 12:00",
                                            style:
                                                CustomFontStyle.font12ClrGRY),
                                        // Adjust the spacing
                                        Spaces.y1,
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.lightBlueAccent,
                                              radius: 2.h,
                                              child: const Icon(Icons.message,
                                                  color: Colors.white),
                                            ),
                                            Spaces.x2,
                                            CircleAvatar(
                                              radius: 2.h,
                                              backgroundColor:
                                                  Colors.lightBlueAccent,
                                              child: const Icon(Icons.call,
                                                  color: Colors.white),
                                            ),
                                            Spaces.x2,
                                            CircleAvatar(
                                              radius: 2.h,
                                              backgroundColor:
                                                  Colors.lightBlueAccent,
                                              child: const Icon(
                                                  Icons.video_call,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20), // Adjust the padding
                                      backgroundColor:
                                          Colors.lightBlue.shade100,
                                    ),
                                    onPressed: () {
                                      // Add your functionality here
                                    },
                                    child: Text('Təsdiq etdim',
                                        style: CustomFontStyle.font12ClrBLU),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(14),
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 1.h),
                                  tileColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 5.h,
                                    backgroundImage: const NetworkImage(
                                      'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGdpcmwlMjAlMjBkb2N0b3IlMjBwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHx8MA%3D%3D',
                                    ),
                                  ),
                                  title: Text("Patient 1",
                                      style: CustomFontStyle.font12ClrBlk),
                                  subtitle: Container(
                                    // Wrap subtitle with Container
                                    width: MediaQuery.of(context).size.width *
                                        0.6, // Adjust the width as needed
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Burundan qanaxma",
                                            style:
                                                CustomFontStyle.font12ClrGRY),
                                        Text("28 Okt 2023 | 12:00",
                                            style:
                                                CustomFontStyle.font12ClrGRY),
                                        // Adjust the spacing
                                        Spaces.y1,
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.lightBlueAccent,
                                              radius: 2.h,
                                              child: const Icon(Icons.message,
                                                  color: Colors.white),
                                            ),
                                            Spaces.x2,
                                            CircleAvatar(
                                              radius: 2.h,
                                              backgroundColor:
                                                  Colors.lightBlueAccent,
                                              child: const Icon(
                                                Icons.call,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Spaces.x2,
                                            CircleAvatar(
                                              radius: 2.h,
                                              backgroundColor:
                                                  Colors.lightBlueAccent,
                                              child: const Icon(
                                                Icons.video_call,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
