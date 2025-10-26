import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  final bannerList = [
    "https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
    "https://o.devio.org/images/fa/cat-4098058__340.webp",
    "https://o.devio.org/images/fa/photo-1601513041797-a79a526a521e.webp",
    "https://o.devio.org/images/other/as-cover.png",
    "https://o.devio.org/images/other/rn-cover2.png",
  ];

  final alphaScrollOffset = 100;

  get _appbar => Obx(
    () => Opacity(
      opacity: controller.appbarOpacity.value,
      child: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("首页", style: TextStyle(fontSize: 16.sp)),
          ),
        ),
      ),
    ),
  );

  get _swiper => Container(
    height: 150.h,
    child: Swiper(
      outer: false,
      autoplayDelay: 5000,
      itemCount: bannerList.length ?? 0,
      autoplay: true,
      loop: true,
      indicatorLayout: PageIndicatorLayout.NONE,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          child: Image.network(bannerList[index] ?? "", fit: BoxFit.cover),
        );
      },
    ),
  );

  get _listView => ListView(
    children: [
      _swiper,
      const SizedBox(height: 800, child: ListTile(title: Text("hehehehehe"))),
    ],
  );

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener(
            onNotification: (scrollNotify) {
              if (scrollNotify is ScrollUpdateNotification &&
                  scrollNotify.depth == 0) {
                _onScroll(scrollNotify.metrics.pixels);
              }
              return false;
            },
            child: _listView,
          ),
          _appbar,
        ],
      ),
    );
  }

  void _onScroll(double offset) {
    double alpha = offset / alphaScrollOffset;
    print("alpha:${alpha}, offset: ${offset}");
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    controller.appbarOpacity.value = alpha;
  }
}
