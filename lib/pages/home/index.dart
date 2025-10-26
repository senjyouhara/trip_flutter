import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        // child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 添加这一行
            children: [
              Container(child: Obx(() => Text("Home${controller.count}"))),
              ElevatedButton(
                onPressed: () {
                  controller.increment();
                },
                child: Text("点击累加"),
              ),
            ],
          ),
        )
        // ),
      ),
    );
  }
}
