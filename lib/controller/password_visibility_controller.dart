import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class PasswordVisibleController extends GetxController{
  RxBool isEyeOpen = false.obs;
  changeVisibility(){
    isEyeOpen.value=!isEyeOpen.value;
  }

}