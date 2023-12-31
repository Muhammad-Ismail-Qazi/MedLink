import 'package:get/get.dart';

class RemainderController extends GetxController{
  RxInt reminderSelectedIndex =0.obs;

  changeReminder(int newIndex){
    reminderSelectedIndex.value = newIndex;

  }

}