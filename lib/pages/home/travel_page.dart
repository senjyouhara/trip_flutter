

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'travel_controller.dart';


class TravelPage extends GetView<TravelController> {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TravelController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("旅拍"),
      ),
      body: SafeArea(
          child: Center(
          )
      ),
    );
  }
}
