import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medlink/controller/doctor_controller.dart';
import 'package:medlink/controller/time_selection_controller.dart';
import 'package:sizer/sizer.dart';
import '../../constants/space_values.dart';
import '../../controller/appointment_controller.dart';
import '../../controller/bottom_time_selection_controller.dart';
import '../../controller/reminder_controller.dart';
import '../../controller/time_textfield_controller.dart';
import '../../model/doctor_model.dart';
import '../../widgets/custom_button.dart';

class SelectTimeScreen extends StatefulWidget {
  const SelectTimeScreen({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  State<SelectTimeScreen> createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  final controller = Get.find<DoctorController>();
  final appointmentController = Get.find<AppointmentController>();
  // List<String> options = ['Bu gun, 23 Sen,', 'Sabah, 24 Sen', 'B.e gunu'];
  List<String> optionSub = ['Masguldur,', '9 uygun gun', '10 uyoun gun'];

  int reminderSelectedIndex = 0;

  final TimeSelectionController timeSelectionController =
      Get.put(TimeSelectionController());
  final TimeTextFieldController textFieldController =
      Get.put(TimeTextFieldController());
  final BottomTimeSelectionController bottomTimeSelectionController =
      Get.put(BottomTimeSelectionController());
  final RemainderController remainderController =
      Get.put(RemainderController());

  List<DateTime> dates = [];
  List statuses = [];
  var firstAvailableDate = DateTime.now(), firstAvailableStatus = '';
  @override
  void initState() {
    super.initState();
    dates =
        widget.doctor.status!.keys.map((key) => DateTime.parse(key)).toList();
    dates.sort();
    appointmentController.selectedDate = dates.first;
    statuses = widget.doctor.status!.values.toList();

    // Assuming this code is within a method or a function
    List<DateTime> availableDates = widget.doctor.status!.entries
        .where((entry) => entry.value == "Available")
        .map((entry) => DateTime.parse(entry.key))
        .toList();

// Sort the available dates in ascending order
    availableDates.sort();

// Retrieve the first available date after sorting
    if (availableDates.isNotEmpty) {
      firstAvailableDate = availableDates.first;
      firstAvailableStatus = "Available";
    }
    setState(() {});
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

        SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 90.w,
              height: 98.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spaces.y4,
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
                      Text("Hakim tap",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spaces.y3,
                  Card(
                    elevation: 0.3,
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    widget.doctor.imgUrl,
                                    width: 25.w,
                                    height: 10.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Spaces.x2,
                              Flexible(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.doctor.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 2.h,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      widget.doctor.designation,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Spaces.y1_0,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Expanded(child: Text("87%")),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(CupertinoIcons.power,
                                                  color: Colors.lightBlue,
                                                  size: 2.h),
                                              Spaces.x1,
                                              Flexible(
                                                child: Text(
                                                    "${widget.doctor.rates}/saat",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.grey,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spaces.y3,
                  Flexible(
                      child: SizedBox(
                          height: 7.h,
                          child: ListView.builder(
                            itemCount: dates.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (c, index) {
                              return Obx(() {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (statuses[index] != "Busy") {
                                        timeSelectionController
                                            .changeSelection(index);
                                        appointmentController.selectedDate =
                                            dates[index];
                                        setState(() {});
                                      } else {
                                        Get.showSnackbar(const GetSnackBar(
                                          title: "Attention",
                                          message: "Date not available",
                                          isDismissible: true,
                                        ));
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        backgroundColor: timeSelectionController
                                                    .selectedIndex.value ==
                                                index
                                            ? Colors.lightBlue.shade200
                                            : Colors
                                                .white, // Change color based on selection
                                        surfaceTintColor: Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${DateTime.now().difference(dates[index]).inDays == 0 && dates[index].day == DateTime.now().day ? "Bu gun" : ""} ${dates[index].day}/${dates[index].month}/${dates[index].year}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                              color: timeSelectionController
                                                          .selectedIndex
                                                          .value !=
                                                      index
                                                  ? Colors.lightBlue
                                                  : Colors.white,
                                            )),
                                        Text(statuses[index],
                                            style: TextStyle(
                                              color: timeSelectionController
                                                          .selectedIndex
                                                          .value !=
                                                      index
                                                  ? Colors.lightBlue
                                                  : Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                          ))),
                  Spaces.y3,
                  Text(
                    "${DateTime.now().difference(firstAvailableDate).inDays == 0 && firstAvailableDate.day == DateTime.now().day ? "Bu gun," : ""} ${firstAvailableDate.day}/${firstAvailableDate.month}/${firstAvailableDate.year}",
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                  Spaces.y1,
                  const Text(
                    "Masguldur",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spaces.y2,
                  CustomElevatedButton(
                      height: 6.h,
                      buttonText:
                          "${appointmentController.selectedDate.day}/${appointmentController.selectedDate.month}/${appointmentController.selectedDate.year}",
                      backgroundColor: Colors.lightBlue.shade200,
                      textColor: Colors.white,
                      width: 90.w,
                      onPressed: () {
                        _showTimeSelectionBottomSheet();
                        // Get.toNamed('/appt_time2');
                        // Get.toNamed('/lctnSc');
                      },
                      color: Colors.lightBlue.shade200),
                  Spaces.y2,
                  const Text(
                    "Va ya",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Spaces.y2,
                  Obx(() {
                    return TextFormField(
                      controller: TextEditingController(
                          text: textFieldController.textFieldText.value),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.lightGreen.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.lightGreen.shade200)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.lightGreen.shade200)),
                          filled: false,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 3.w,
                          )),
                      onTap: () async {
                        final DateTime? pickedDateTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 7)),
                        );
                        if (pickedDateTime != null) {
                          final DateFormat formatter = DateFormat('dd/MM/yyyy');
                          final String formattedDate = formatter.format(
                            pickedDateTime,
                          );
                          appointmentController.selectedDate = pickedDateTime;
                          setState(() {});
                          textFieldController.changeTextfield(formattedDate);
                          _showTimeSelectionBottomSheet(); // Show the time selection bottom sheet
                        }
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.all(0),
      elevation: 3,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            child: Container(
              height: 6.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff61CEFF),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sep 2023',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffbae2fd),
                  radius: 80.0,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/like.png',
                      width: 100.0, // Adjust the width of the image
                      height: 100.0, // Adjust the height of the image
                      fit: BoxFit
                          .cover, // You can choose how the image fits within the circular avatar
                    ),
                  ),
                ),
                Text("Təşəkkürlər!",
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
                Spaces.y1,
                Text("Qeydiyyatınız uğurla qeydə alındı!",
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 10.sp,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold)),
                Spaces.y2,
                Text(
                    textAlign: TextAlign.center,
                    "Sizin qeydiyyatınız  Kardioloq Dr. Nigar ilə 24 Sentyabr 14:00 qeydiyyata alındı",
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 10.sp,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold)),
                Spaces.y2,
                CustomElevatedButton(
                    height: 6.h,
                    buttonText: "Təsdiq",
                    backgroundColor: Colors.lightBlue.shade200,
                    textColor: Colors.white,
                    width: 90.w,
                    onPressed: () {
                      Get.back();
                    },
                    color: Colors.lightBlue.shade200),
                Spaces.y1,
                Text(
                    textAlign: TextAlign.center,
                    "Dəyişiklik et",
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 10.sp,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showTimeSelectionBottomSheet() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 50.h,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Suitable watch",
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spaces.y1,
                SizedBox(
                  height: 10.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 24,
                    itemBuilder: (c, index) {
                      // Build your time selection widgets here
                      return Obx(() {
                        int localSelectedIndex = bottomTimeSelectionController
                            .bottomTimeSelectedIndex.value;
                        return GestureDetector(
                          onTap: () {
                            final selectedTime =
                                TimeOfDay(hour: index, minute: 0);
                            appointmentController.watchTime = selectedTime;
                            setState(() {});
                            localSelectedIndex =
                                index; // Update the local selected index
                            bottomTimeSelectionController
                                .changeBottomTimeSelectedIndex(
                                    localSelectedIndex);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 4.h,
                              backgroundColor: localSelectedIndex == index
                                  ? Colors.lightBlue.shade200
                                  : Colors.white,
                              child: Text(
                                '$index:00',
                                style: TextStyle(
                                  color: localSelectedIndex == index
                                      ? Colors.white
                                      : Colors.lightBlue,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
                Spaces.y5,
                Text(
                  textAlign: TextAlign.center,
                  "Reminder in advance",
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spaces.y1,
                SizedBox(
                  height: 10.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 18,
                    itemBuilder: (c, index) {
                      // Build your time selection widgets here
                      return Obx(() {
                        int localReminder =
                            remainderController.reminderSelectedIndex.value;
                        return GestureDetector(
                          onTap: () {
                            appointmentController.reminderTime =
                                "${10 * (index + 1)}";
                            localReminder =
                                index; // Update the local selected index
                            // timeController.text = selectedTime.format(context);
                            remainderController.changeReminder(localReminder);
                            // Close the bottom sheet
                            // Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 4.h,
                              backgroundColor: localReminder == index
                                  ? Colors.lightBlue.shade200
                                  : Colors.white,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  '${10 * (index + 1)} \nminutes',
                                  style: TextStyle(
                                      color: localReminder == index
                                          ? Colors.white
                                          : Colors.lightBlue,
                                      height: 0),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
                Spaces.y2,
                Center(
                  child: CustomElevatedButton(
                      height: 6.h,
                      buttonText: "Təsdiq et",
                      backgroundColor: Colors.lightBlue.shade200,
                      textColor: Colors.white,
                      width: 90.w,
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        await appointmentController
                            .bookAppointment(widget.doctor.uid);
                        Get.back();

                        // ignore: use_build_context_synchronously
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog(context));
                      },
                      color: Colors.lightBlue.shade200),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
