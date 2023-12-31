import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/constants/text_style.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';

class SetAppointment extends StatefulWidget {
  const SetAppointment({Key? key}) : super(key: key);

  @override
  State<SetAppointment> createState() => _SetAppointmentState();
}

class _SetAppointmentState extends State<SetAppointment> {
  List<String> time = [
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
  ];
  int selectedIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

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
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              width: 90.w,
              height: 98.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          "Görüş təyin edin",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spaces.y3,
                    Card(
                      elevation: 3,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 5.h,
                          backgroundImage: const NetworkImage(
                            'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGdpcmwlMjAlMjBkb2N0b3IlMjBwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHx8MA%3D%3D',
                          ),
                        ),
                        title: Text(
                          'Dr. Nigar',
                          style: CustomFontStyle.font12ClrBlk,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kardioloq',
                              style: CustomFontStyle.font10ClrGRY,
                            ),
                            Spaces.y1,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.star, color: Colors.yellow),
                                const Icon(Icons.star, color: Colors.yellow),
                                const Icon(Icons.star, color: Colors.yellow),
                                const Icon(Icons.star, color: Colors.yellow),
                                const Icon(Icons.star_half,
                                    color: Colors.yellow),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '\$25',
                                      style: CustomFontStyle.font12ClrBLU,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spaces.y2,
                    Text(
                      'Tarix',
                      style: CustomFontStyle.font12ClrFntWtBldBlk,
                    ),
                    Spaces.y1,
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          hintText: selectedDate != null
                              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                              : 'Select a date',
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                    Spaces.y2,
                    Wrap(
                      spacing: 8.w, // Adjust the spacing between buttons
                      runSpacing: 2.h, // Adjust the spacing between rows
                      children: [
                        for (int index = 0; index < time.length; index++)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex =
                                    index; // Update the selected index
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              backgroundColor: selectedIndex == index
                                  ? Colors.lightBlue.shade200
                                  : Colors.white,
                              surfaceTintColor: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                time[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: selectedIndex != index
                                      ? Colors.lightBlue
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        for (int index = time.length;
                            index < time.length * 2;
                            index++)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex =
                                    index; // Update the selected index
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              backgroundColor: selectedIndex == index
                                  ? Colors.lightBlue.shade200
                                  : Colors.white,
                              surfaceTintColor: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                time[index - time.length],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: selectedIndex != index
                                      ? Colors.lightBlue
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Spaces.y5,
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            backgroundColor: Colors.lightBlueAccent,
                            surfaceTintColor: Colors.lightBlueAccent),
                        onPressed: () {
                          // Add functionality for "Qəbul et" button
                        },
                        child: Text('Qəbul et',
                            style: CustomFontStyle.font12ClrWIT),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now()
          .add(const Duration(days: 365)), // Adjust the range as needed
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
