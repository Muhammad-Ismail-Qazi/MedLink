import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/constants/firebase_conts.dart';
import 'package:medlink/controller/media_controlller.dart';
import 'package:medlink/model/appt_model.dart';

import '../main.dart';

class AppointmentController extends GetxController {
  final mediaController = Get.find<MediaController>();
  final nameController = TextEditingController(),
      contactController = TextEditingController();
  var selectedHr = '',
      selectedDate = DateTime.now(),
      watchTime = TimeOfDay.now(),
      reminderTime = '10';

  bookAppointment(String drId) async {
    List downloadUrls = [];
    for (var file in mediaController.imgPaths) {
      var url = await uploadMediatoStorage(File(file.imgUrl));
      downloadUrls.add(url);
    }
    AppointmentModel appointmentModel = AppointmentModel(
        uid: uuid.v1(),
        doctor: drId,
        patient: 'auth.currentUser!.uid',
        reminderTime: reminderTime,
        watchTime: watchTime.toString(),
        date: selectedDate,
        urls: downloadUrls);
    await appointmentCollection
        .doc(appointmentModel.uid)
        .set(appointmentModel.toMap());
  }

  Future<String> uploadMediatoStorage(File image) async {
    final Reference storageRef =
        storage.ref().child("appt/${DateTime.now()}.png");
    UploadTask task = storageRef.putFile(image);
    TaskSnapshot taskSnapshot = await task;
    var downloads = await taskSnapshot.ref.getDownloadURL();
    return downloads;
  }
}
