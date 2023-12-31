import 'package:get/get.dart';

class TimeSelectionController extends GetxController {
  RxInt selectedIndex = 0.obs;

  changeSelection(int newIndex) {
    selectedIndex.value = newIndex;
  }
}
