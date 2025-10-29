

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_controller.dart';



class MyPage extends GetView<MyController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的"),
      ),
      body: SafeArea(
          child: Center(
          )
      ),
    );
  }
}
