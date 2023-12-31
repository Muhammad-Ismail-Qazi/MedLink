import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlink/controller/appointment_controller.dart';
import 'package:medlink/controller/doctor_controller.dart';
import 'package:medlink/controller/media_controlller.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'routes.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: GetMaterialApp(
          title: 'Medlink',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.splashSc,
          initialBinding: BindingsBuilder(() {
            Get.put(DoctorController());
            Get.put(MediaController());
            Get.put(AppointmentController());
          }),
          getPages: AppRoutes.routes,
        ),
      );
    });
  }
}
