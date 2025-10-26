import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  late SharedPreferences _preferences;

  @override
  void onInit() async {
    super.onInit();
    await getInstance();
  }

  Future<void> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// 根据key存储Map类型
  Future<bool> setMap(String key, Map value) {
    return _preferences.setString(key, json.encode(value));
  }

  /// 根据key获取Map类型
  Map<String, dynamic>? getMap(String key) {
    String jsonStr = _preferences.getString(key) ?? "";
    return jsonStr.isEmpty ? null : json.decode(jsonStr);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return _preferences.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    return _preferences.getStringList(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return _preferences.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    return _preferences.getBool(key);
  }

  Future<bool> setInt(String key, int value) async {
    return _preferences.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    return _preferences.getInt(key);
  }

  Future<bool> setString(String key, String value) async {
    return _preferences.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return _preferences.getString(key);
  }

  Future<bool> setDouble(String key, double value) async {
    return _preferences.setDouble(key, value);
  }

  Future<double?> getDouble(String key) async {
    return _preferences.getDouble(key);
  }

  Future<dynamic?> getDynamic(String key) async {
    return _preferences.get(key);
  }

  Future<bool?> remove(String key) async {
    return _preferences.remove(key);
  }

  Future<bool?> removeAll() async {
    return _preferences.clear();
  }

  /// 重新加载所有数据,仅重载运行时
  Future<void> reload() async {
    return await _preferences.reload();
  }
}
