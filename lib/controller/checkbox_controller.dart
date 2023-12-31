import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CheckboxController extends GetxController {
  static RxBool  isChecked = false.obs;

  checkBoxState() {
    isChecked.value = !isChecked.value;
  }
}
