
import 'package:flutter/cupertino.dart';

import '../../controller/checkbox_controller.dart';

class FormValidation{

  static String? validateName(String value){

      if (value!.isEmpty) {
        return 'Please enter your name';
      } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
        return 'Please enter a valid name (letters and spaces only)';
      }
      return null; // Return null when the password is valid.

  }
 static String? validateEmail(String value){
      if (value!.isEmpty ||
          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
        return 'Enter a valid email!';
      }
      return null;

  }
 static String? validatePassword(String value){
      if (value!.isEmpty) {
        return 'Please enter a password';
      } else if (value.length < 8) {
        return 'Password must be at least 8 characters';
      } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}|<>?])').hasMatch(value)) {
        return 'Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
      }
      return null; // Return null when the password is valid.


  }

  static bool? validateCheckBox(){
   if(CheckboxController.isChecked== false){
     return false;
   }
   return true ;
  }

}