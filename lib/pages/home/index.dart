import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_flutter/pages/home/home_page.dart';
import 'package:trip_flutter/pages/home/my_page.dart';
import 'package:trip_flutter/pages/home/search_page.dart';
import 'package:trip_flutter/pages/home/travel_page.dart';

import '../../widget/keep_alive_wrapper.dart';

class IndexController extends GetxController {
  var currentIndex = 0.obs;
}

class IndexPage extends GetView<IndexController> {
  IndexPage({super.key});

  final PageController _pageController = PageController(initialPage: 0);
  var _defaultColor = Colors.grey;
  var _activateColor = Colors.blue;

  var tabbarList = [
    (title: "首页", icon: Icons.home, page: HomePage()),
    (title: "搜索", icon: Icons.search, page: SearchPage()),
    (title: "旅拍", icon: Icons.camera_alt, page: TravelPage()),
    (title: "我的", icon: Icons.account_circle, page: MyPage()),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(IndexController());

    return KeepAliveWrapper(
      keepAlive: true,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: tabbarList.map((item) => item.page).toList(),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            // 去掉水波纹效果
            // splashColor: Colors.transparent,
            // 去掉长按效果
            highlightColor: Colors.transparent,
          ),
          child: Obx(
            () => BottomNavigationBar(
              // 设置文字大小
              selectedFontSize: 14,
              unselectedFontSize: 14,
              // fixedColor: Colors.blue,
              currentIndex: controller.currentIndex.value,
              selectedItemColor: _activateColor,
              unselectedItemColor: _defaultColor,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                _pageController.jumpToPage(index);
                controller.currentIndex.value = index;
              },
              items: tabbarList.asMap().entries.map((entry) => _bottomIconItem(entry.value.title, entry.value.icon, entry.key) as BottomNavigationBarItem).toList(),
            ),
          ),
        ),
      ),
    );
  }

  _bottomIconItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }
}
