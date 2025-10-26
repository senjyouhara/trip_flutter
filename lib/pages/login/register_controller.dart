import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController {

  final UsernameController = TextEditingController();
  final PasswordController = TextEditingController();
  final RePasswordController = TextEditingController();

  var userName = "".obs;
  var password = "".obs;
  var rePassword = "".obs;

  String? checkInputValue(String? value, String? type){
    if(type == 'password'){
      if (value == null ||
          value.isEmpty ||
          value.length < 5) {
        return "密码最少5位";
      }
      return null;
    }
    else if(type == 'rePassword'){
      if (value == null ||
          value.isEmpty ||
          value.length < 5) {
        return "确认密码最少5位";
      }
      return null;
    }

    if (value == "" ||
        value == null ||
        value.length < 5) {
      return "用户名最少5位";
    }
    return null;

  }

  @override
  void onInit() {
    userName.value = "";
    password.value = "";
    rePassword.value = "";
    UsernameController.text = userName.value;
    PasswordController.text = password.value;
    RePasswordController.text = rePassword.value;
  }

  Color get validColor {
    final usernameValid = checkInputValue(userName.value, null) == null;
    final passwordValid = checkInputValue(password.value, "password") == null;
    final rePasswordValid = checkInputValue(rePassword.value, "rePassword") == null;
    print(": usernameValid: ${usernameValid}, ${passwordValid}, ${rePasswordValid}");
    return usernameValid && passwordValid && rePasswordValid ? Colors.green : Colors.white70;
  }

}