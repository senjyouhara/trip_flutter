

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchPage extends GetView<SearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("搜索"),
      ),
      body: SafeArea(
          child: Center(
          )
      ),
    );
  }
}
