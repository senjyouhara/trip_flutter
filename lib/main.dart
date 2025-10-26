import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'config.dart';
import 'service/shared_preferences_service.dart';

void main() async {
  // 初始化插件前需调用初始化代码 runApp()函数之前
  WidgetsFlutterBinding.ensureInitialized();

  /// 初始持久化数据
  Get.put(SharedPreferencesService());
  await webViewInit();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 竖屏，顶部朝上
    DeviceOrientation.portraitDown, // 竖屏，顶部朝下
  ]);

  runApp(MyApp());

  // 小白条、导航栏沉浸
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
    ),
  );
}
