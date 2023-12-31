import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/constants/firebase_conts.dart';
import 'package:medlink/controller/doctor_controller.dart';
import 'package:medlink/model/appt_model.dart';
import 'package:sizer/sizer.dart';
import '../../../Constants/space_values.dart';
import '../../../model/signup_model.dart';
import '../../../widgets/drawer_widget.dart';
import '../../doctor_pannels/patient_details.dart';

class HomePageDoctor extends StatefulWidget {
  const HomePageDoctor({super.key});

  @override
  State<HomePageDoctor> createState() => _HomePageDoctorState();
}

class _HomePageDoctorState extends State<HomePageDoctor> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  DoctorController controller = Get.find<DoctorController>();

  @override
  void initState() {
    super.initState();
    controller.getCurrentDoctor();
    controller.getAppts('CfwOQjWRsAOGSL1i5DwE');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        drawer: DrawerWidget(mounted: mounted, scaffoldState: _scaffoldkey),
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
              padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 6.w),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.lightBlue.shade200,
                    Colors.teal.shade200
                  ], // Define your gradient colors
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Salam",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp)),
                      Obx(
                        () => Text(controller.activeDoctor.value.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Obx(
                    () => CircleAvatar(
                      radius: 4.5.h,
                      backgroundImage:
                          NetworkImage(controller.activeDoctor.value.imgUrl),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    height: 75.h,
                    width: 88.w,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 3.h,
                                ),
                                margin: EdgeInsets.symmetric(
                                  // horizontal: 3.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF82D7E3),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Pasientlərin sayı",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Spaces.y0,
                                    Obx(
                                      () => Text(
                                        controller.allAppts.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              Spaces.x6,
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 3.h,
                                ),
                                margin: EdgeInsets.symmetric(
                                  // horizontal: 3.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF82D7E3),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Bu günə müraciət",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Spaces.y0,
                                    Text(
                                      controller.allAppts
                                          .where((appt) =>
                                              appt.date
                                                      .difference(
                                                          DateTime.now())
                                                      .inDays ==
                                                  0 &&
                                              appt.date.day ==
                                                  DateTime.now().day)
                                          .toList()
                                          .length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w800),
                                    )
                                  ],
                                ),
                              )),
                            ],
                          ),
                          Text(
                            "Son müraciətlər",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          Obx(
                            () => ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.allAppts.length,
                                itemBuilder: (c, index) {
                                  return PatientCard(
                                      appt: controller.allAppts[index]);
                                }),
                          )
                        ],
                      ),
                    ))),
          ],
        ));
  }
}

class PatientCard extends StatefulWidget {
  const PatientCard({
    super.key,
    required this.appt,
  });

  final AppointmentModel appt;

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  final controller = Get.find<DoctorController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade200)),
      child: StreamBuilder(
          stream: usersCollection.doc(widget.appt.patient).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            } else {
              UserModel userModel = UserModel.fromMap(
                  snapshot.data!.data() as Map<String, dynamic>);
              return ListTile(
                onTap: () {
                  Get.to(DoctorSidePatientDetails(
                    user: userModel,
                    appt: widget.appt,
                  ));
                },
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                leading: CircleAvatar(
                  radius: 4.h,
                  backgroundImage: NetworkImage(widget.appt.urls.first),
                ),
                title: Text(
                  userModel.username,
                  style: TextStyle(fontSize: 18..sp),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Burundan qanaxma"),
                    Text(
                        "${widget.appt.date.day}-${widget.appt.date.month}-${widget.appt.date.year} | ${widget.appt.date.hour.toString().padLeft(2, '0')}:${widget.appt.date.minute.toString().padLeft(2, '0')}"),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 1.6.h,
                          backgroundColor: Colors.lightBlueAccent.shade100,
                          child: Icon(
                            CupertinoIcons.chat_bubble,
                            color: Colors.white,
                            size: 2.h,
                          ),
                        ),
                        Spaces.x1,
                        CircleAvatar(
                          radius: 1.6.h,
                          backgroundColor: Colors.lightBlueAccent.shade100,
                          child: Icon(
                            CupertinoIcons.phone_fill,
                            color: Colors.white,
                            size: 2.h,
                          ),
                        ),
                        Spaces.x1,
                        CircleAvatar(
                          radius: 1.6.h,
                          backgroundColor: Colors.lightBlueAccent.shade100,
                          child: const Icon(
                            CupertinoIcons.videocam,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
