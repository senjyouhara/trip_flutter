import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../extensions/image_extension.dart';

import '../../widget/loading.dart';
import 'input_widget.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  final formKey = GlobalKey<FormState>();

  void _onSubmit() async {
    FocusScope.of(Get.context!).unfocus();
    if (formKey.currentState!.validate()) {
      Loading.showLoading(duration: Duration(seconds: 2), title: "注册中请稍后……");
      await Future.delayed(Duration(seconds: 2));
      Get.offNamed(
        '/login',
        arguments: {
          'userName': controller.userName.value,
          'password': controller.password.value,
        },
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [..._background(), ..._content()]));
  }

  _background() {
    return [
      Positioned.fill(
        child: Image.asset(
          "register_bg.jpg".img,
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black45),
        ),
      ),
    ];
  }

  _content() {
    return [
      Positioned.fill(
        left: 25.w,
        right: 25.w,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, size: 36.sp, color: Colors.white),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(height: 100.h),
            Text(
              "账号密码登录",
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            SizedBox(height: 40.h),
            Form(
              key: formKey,
              child: Column(
                spacing: 20.h,
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: controller.UsernameController,
                    onChanged: (val) {
                      controller.UsernameController.text = val;
                      controller.userName.value = val;
                    },
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                      FilteringTextInputFormatter.deny(RegExp(r"\s*")),
                    ],
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    decoration: textFormCommonInputDecoration("用户名"),
                    validator: (value) =>
                        controller.checkInputValue(value, null),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.PasswordController,
                    onChanged: (val) {
                      controller.PasswordController.text = val;
                      controller.password.value = val;
                    },
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                      FilteringTextInputFormatter.deny(RegExp(r"\s*")),
                    ],
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    decoration: textFormCommonInputDecoration("密码"),
                    validator: (value) =>
                        controller.checkInputValue(value, "password"),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.RePasswordController,
                    onChanged: (val) {
                      controller.RePasswordController.text = val;
                      controller.rePassword.value = val;
                    },
                    textInputAction: TextInputAction.none,
                    onEditingComplete: () {
                      _onSubmit();
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                      FilteringTextInputFormatter.deny(RegExp(r"\s*")),
                    ],
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    decoration: textFormCommonInputDecoration("确认密码"),
                    validator: (value) {
                      String? result = controller.checkInputValue(
                        value,
                        "rePassword",
                      );
                      if (result == null) {
                        if (value == controller.password.value) {
                          return null;
                        } else {
                          return "两次密码不一致";
                        }
                      }
                      return result;
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 30.h),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Obx(
                        () => FilledButton(
                          onPressed: _onSubmit,
                          style: FilledButton.styleFrom(
                            // side: BorderSide(color: Colors.white), // 修改边框颜色
                            padding: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16), // 圆角大小
                            ),
                            backgroundColor: controller.validColor,
                          ),
                          child: Text(
                            "注册账号",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
