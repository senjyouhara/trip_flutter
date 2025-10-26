

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration textFormCommonInputDecoration(String labelText) {
  return InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 0.5.w),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.w),
    ),
    labelText: labelText ?? "请输入",
    floatingLabelBehavior: FloatingLabelBehavior.never,
    // 禁止label上浮
    labelStyle: TextStyle(color: Colors.white),
  );
}

Widget commonTextForm(TextFormField config, String labelText) {
  return TextFormField(
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white, fontSize: 17.sp),
    decoration: textFormCommonInputDecoration(labelText),
  );
}