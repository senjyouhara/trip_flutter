
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final UsernameController = TextEditingController();
  final PasswordController = TextEditingController();

  var userName = "".obs;
  var password = "".obs;

  String? checkInputValue(String? value, String? type){
    if(type == 'password'){
      if (value == null ||
          value.isEmpty ||
          value.length < 5) {
        return "密码最少5位";
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
    print("Get.arguments: ${Get.arguments}");
    userName.value = Get.arguments?["userName"] ?? "";
    password.value = Get.arguments?["password"] ?? "";
    UsernameController.text = userName.value;
    PasswordController.text = password.value;
  }

  Color get validColor {
    final usernameValid = checkInputValue(userName.value, null) == null;
    final passwordValid = checkInputValue(password.value, "password") == null;
    return usernameValid && passwordValid ? Colors.orange : Colors.white70;
  }
}