import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/controller/doctor_controller.dart';
import 'package:medlink/model/signup_model.dart';
import 'package:sizer/sizer.dart';
import '../../constants/text_style.dart';
import '../../model/appt_model.dart';

class DoctorSidePatientDetails extends StatefulWidget {
  const DoctorSidePatientDetails(
      {super.key, required this.appt, required this.user});
  final AppointmentModel appt;
  final UserModel user;

  @override
  State<DoctorSidePatientDetails> createState() =>
      _DoctorSidePatientDetailsState();
}

class _DoctorSidePatientDetailsState extends State<DoctorSidePatientDetails> {
  final controller = Get.find<DoctorController>();
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: Obx(
                              () => CircleAvatar(
                                radius: 5.h,
                                backgroundImage: NetworkImage(
                                  controller.activeDoctor.value.imgUrl,
                                ),
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
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Obx(
                            () => Text(
                              controller.activeDoctor.value.name,
                              style: CustomFontStyle.font16ClrWt,
                            ),
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
                    "Pasient haqqında",
                    style: CustomFontStyle.font16ClrB,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    tileColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        widget.appt.urls.first,
                      ),
                    ),
                    title: Text(
                      widget.user.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Burundan qanaxma",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "${widget.appt.date.day}-${widget.appt.date.month}-${widget.appt.date.year} | ${widget.appt.date.hour.toString().padLeft(2, '0')}:${widget.appt.date.minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 10), // Adjust the spacing
                        const Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.message),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.call),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.video_call),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tarix',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${widget.appt.date.day}-${widget.appt.date.month}-${widget.appt.date.year}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                            height:
                                20), // Adjust the spacing between the sections
                        const Text(
                          'Telefon',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          '+94 55 2090818',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                            height:
                                20), // Adjust the spacing between the sections
                        const Text(
                          'Status',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          'Visa ilə ödəniş',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Saat',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${TimeOfDay(
                                hour: int.tryParse(widget.appt.watchTime
                                        .split('(')[1]
                                        .split(':')[0]) ??
                                    0,
                                minute: int.tryParse(widget.appt.watchTime
                                        .split(':')[1]
                                        .split(')')[0]) ??
                                    0,
                              ).hour.toString().padLeft(2, '0')}: ${TimeOfDay(
                                hour: int.tryParse(widget.appt.watchTime
                                        .split('(')[1]
                                        .split(':')[0]) ??
                                    0,
                                minute: int.tryParse(widget.appt.watchTime
                                        .split(':')[1]
                                        .split(')')[0]) ??
                                    0,
                              ).minute.toString().padLeft(2, '0')}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                                height:
                                    20), // Adjust the spacing between the sections
                            const Text(
                              'Email',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              widget.user.email,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                                height:
                                    20), // Adjust the spacing between the sections
                            const Text(
                              'Məbləğ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '\$${controller.activeDoctor.value.rates}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for "Qəbul et" button
                    },
                    child: const Text('Qəbul et'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for "İmtina et" button
                    },
                    child: const Text('İmtina et'),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
