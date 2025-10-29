import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'config.dart';
import 'pages/login/index.dart';
import 'pages/login/register.dart';
import 'utils/permission_util.dart';
import 'pages/index/index.dart';
import 'pages/notfound/index.dart';


class MyApp extends StatefulWidget {

  MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{


  @override
  void didChangeDependencies() async {
    /// 申请写文件权限
    var result = await PermissionUtil.getStoragePermission();
  }


  @override
  Widget build(BuildContext context) {
    // toast必须为顶层组件
    return OKToast(
      // 屏幕适配父组件
      child: ScreenUtilInit(
        designSize: designSize,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // ),
            initialRoute: '/',
            unknownRoute: GetPage(name: '/notfound', page: () => NotFoundPage()),
            getPages: [
              GetPage(name: '/', page: () => IndexPage()),
              GetPage(name: '/login', page: () => LoginPage()),
              GetPage(name: '/register', page: () => RegisterPage()),
            ],
          );
        },
      ),
    );
  }
}
