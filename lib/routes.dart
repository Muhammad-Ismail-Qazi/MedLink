import 'package:get/get.dart';
import 'package:medlink/view/customer/home/home_page.dart';
import 'package:medlink/view/customer/medical_records/add_records_one.dart';
import 'package:medlink/view/customer/settings/profile/edit_profile.dart';
import 'package:medlink/view/customer/settings/profile/profile_screen.dart';
import 'package:medlink/view/diagonstics_testing-screens/diagonstics_test-screen_one.dart';
import 'package:medlink/view/diagonstics_testing-screens/diagonstics_test-screen_two.dart';
import 'package:medlink/view/doctor/doctor_detail.dart';
import 'package:medlink/view/doctor/selected_time-screeen_two.dart';
import 'package:medlink/view/doctor_pannels/doctor_profile.dart';
import 'package:medlink/view/help_center_screen/help_center_screen.dart';
import 'package:medlink/view/location_screen/location_screen.dart';
import 'package:medlink/view/medicine_orders_screen/Medicine%20_orders_screen.dart';
import 'package:medlink/view/on_boarding_screens/on_boarding_screen_one.dart';
import 'package:medlink/view/on_boarding_screens/on_boarding_screen_three.dart';
import 'package:medlink/view/on_boarding_screens/on_boarding_screen_two.dart';
import 'package:medlink/view/registration/login_screen.dart';
import 'package:medlink/view/registration/signup_screen.dart';
import 'package:medlink/view/search/search_screen.dart';
import 'package:medlink/view/splash_screen/splash_screen.dart';

import 'view/doctor/appointment_screen.dart';

class AppRoutes {
  static const String splashSc = '/splashSc';
  static const String onbrdSc1 = '/onbrdSc';
  static const String onbrdSc2 = '/onbrdSc2';
  static const String onbrdSc3 = '/onbrdSc3';
  static const String signup = '/signup';
  static const String loginSc = '/lgnSc';
  static const String hmepge = '/hmepge';
  static const String bottombar = '/bottombar';
  static const String detail = '/doc_detail';
  static const String appt = '/appt_screen';
  static const String apptTime = '/appt_time';
  static const String apptTime2 = '/appt_time2';
  static const String lctnSc = '/lctnSc';
  static const String mdcordrSc = '/mdcordrSc';
  static const String hlpcntrSc = '/hlpcntrSc';
  static const String dgonstctstSc1 = '/dgonstctstSc1';
  static const String dgonstctstSc2 = '/dgonstctstSc2';
  static const String prflSC = '/prflSC';
  static const String rcdSc1 = '/rcdSc1';
  static const String edtprflSC = '/edtprflSC';

  //doctor side panel
  static const String dctrPrfle='/dctrPrfle';

  static List<GetPage> routes = [
    GetPage(
      name: splashSc,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: onbrdSc1,
      page: () => const OnBoardingOneScreen(),
    ),
    GetPage(
      name: onbrdSc2,
      page: () => const OnBoardingTwoScreen(),
    ),
    GetPage(
      name: onbrdSc3,
      page: () => const OnBoardingThreeScreen(),
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: loginSc,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: hmepge,
      page: () => const HomePage(),
    ),
    GetPage(
      name: bottombar,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: detail,
      page: () => const DoctorDetailScreen(),
    ),
    GetPage(
      name: appt,
      page: () => const AppointMentScreen(),
    ),
    // GetPage(
    //   name: apptTime,
    //   page: () => const SelectTimeScreen(),
    // ),
    GetPage(
      name: apptTime2,
      page: () => const SelectTimeScreenTwo(),
    ),
    GetPage(
      name: lctnSc,
      page: () => const LocationScreen(),
    ),
    GetPage(
      name: mdcordrSc,
      page: () => const MedicineOrdersScreen(),
    ),
    GetPage(
      name: hlpcntrSc,
      page: () => const HelpCenterScreen(),
    ),
    GetPage(
      name: dgonstctstSc1,
      page: () => const DiagonsticsTestScreenOne(),
    ),
    GetPage(
      name: dgonstctstSc2,
      page: () => const DiagonsticsTestScreenTwo(),
    ),
    GetPage(
      name: prflSC,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: edtprflSC,
      page: () => const EditProfile(),
    ),
    GetPage(
      name: rcdSc1,
      page: () => const AddRecordsOne(),
    ),
    // Doctor pannel
    GetPage(
      name: dctrPrfle,
      page: () => const DoctorProfile(),
    ),
  ];
}