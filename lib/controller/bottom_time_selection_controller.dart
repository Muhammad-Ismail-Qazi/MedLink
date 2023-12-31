import 'package:get/get.dart';

class BottomTimeSelectionController extends GetxController{
  RxInt bottomTimeSelectedIndex=0.obs;

  changeBottomTimeSelectedIndex(int newIndex){
    bottomTimeSelectedIndex.value= newIndex;
  }

}