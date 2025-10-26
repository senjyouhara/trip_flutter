import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotFoundController extends GetxController {

}

class NotFoundPage extends GetView<NotFoundController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                    child: Text("NotFoundPage")
                )]),
        ),
      ),
    );
  }
}
