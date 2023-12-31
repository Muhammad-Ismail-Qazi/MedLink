

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TimeTextFieldController extends GetxController{
 RxString  textFieldText="".obs;

 changeTextfield( String newTextFieldText ){
   textFieldText.value = newTextFieldText.toString();
 }

}