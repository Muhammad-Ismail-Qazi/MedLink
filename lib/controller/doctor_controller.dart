import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medlink/constants/firebase_conts.dart';
import 'package:medlink/model/appt_model.dart';
import 'package:medlink/model/doctor_model.dart';
import 'package:medlink/model/signup_model.dart';

class DoctorController extends GetxController {
  Rx<DoctorModel> activeDoctor = DoctorModel(
          uid: '',
          name: '',
          imgUrl: '',
          availability: [],
          ratings: 0,
          designation: '',
          rates: 0,
          email: '',
          experiance: '',
          institude: '',
          phone: '')
      .obs;
  late StreamSubscription<QuerySnapshot> doctorsStream;
  late StreamSubscription<QuerySnapshot> patientsStream;
  late StreamSubscription<QuerySnapshot> apptsStream;

  RxList<DoctorModel> allDoctors = RxList<DoctorModel>([]);
  RxList<AppointmentModel> allAppts = RxList<AppointmentModel>([]);

  void getDoctors() async {
    doctorsStream = doctorsCollection.snapshots().listen((querySnapshot) {
      allDoctors.value = [];

      for (var document in querySnapshot.docs) {
        DoctorModel doctor = DoctorModel.fromMap(document.data());
        allDoctors.add(doctor);
      }
    });
  }

  void getCurrentDoctor() async {
    //replace by auth.currentuser.uid
    await doctorsCollection.doc('CfwOQjWRsAOGSL1i5DwE').get().then((doc) {
      if (doc.exists) {
        activeDoctor.value =
            DoctorModel.fromMap(doc.data() as Map<String, dynamic>);
      }
    });
  }

  void getAppts(String doctor) async {
    apptsStream = appointmentCollection
        .where("doctor", isEqualTo: doctor)
        .snapshots()
        .listen((querySnapshot) {
      allAppts.value = [];
      for (var doc in querySnapshot.docs) {
        AppointmentModel appointmentModel =
            AppointmentModel.fromMap(doc.data());
        allAppts.add(appointmentModel);
      }
    });
  }

  Future<UserModel?> getPatient(String uid) async {
    await usersCollection.doc(uid).get().then((doc) {
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
    });
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    getDoctors();
  }

  @override
  void onClose() {
    super.onClose();
    doctorsStream.cancel();
    apptsStream.cancel();
  }
}
