import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../models/home_mainMenus_model_entity_entity.dart';
import '../../../../extensions/color_extension.dart';

class MainMenus extends StatelessWidget {
  MainMenus({super.key, required this.mainMenus});

  List<HomeMainMenusModelEntityEntity> mainMenus = [];

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black12,
      borderRadius: BorderRadius.all(Radius.circular(6.r)),
      child: Column(
        spacing: 2.h,
        children: mainMenus.map((menuItem) {
          return Row(
            spacing: 2.w,
            children: [
              _mainMenu(menuItem.mainMenu!),
              GridView.builder(
                shrinkWrap: true,
                itemCount: menuItem.subMenus?.length ?? 0,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return _subMenu(
                    menuItem.subMenus![index],
                    menuItem.subColor!,
                  );
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _mainMenu(HomeMainMenusModelEntityMainMenu menu) {
    return Container();
  }

  Widget _subMenu(HomeMainMenusModelEntitySubMenus menu, String color) {
    return Container(
      decoration: BoxDecoration(color: Color(24).fromHex(color)),
      child: Expanded(
        child: Column(
          spacing: 10,
          children: [
            Image.asset(menu.icon!),
            Text(
              menu.label!,
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
