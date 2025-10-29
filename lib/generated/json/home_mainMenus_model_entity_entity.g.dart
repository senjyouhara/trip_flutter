import 'package:trip_flutter/generated/json/base/json_convert_content.dart';
import 'package:trip_flutter/models/home_mainMenus_model_entity_entity.dart';

HomeMainMenusModelEntityEntity $HomeMainMenusModelEntityEntityFromJson(
    Map<String, dynamic> json) {
  final HomeMainMenusModelEntityEntity homeMainMenusModelEntityEntity = HomeMainMenusModelEntityEntity();
  final HomeMainMenusModelEntityMainMenu? mainMenu = jsonConvert.convert<
      HomeMainMenusModelEntityMainMenu>(json['mainMenu']);
  if (mainMenu != null) {
    homeMainMenusModelEntityEntity.mainMenu = mainMenu;
  }
  final String? subColor = jsonConvert.convert<String>(json['subColor']);
  if (subColor != null) {
    homeMainMenusModelEntityEntity.subColor = subColor;
  }
  final List<
      HomeMainMenusModelEntitySubMenus>? subMenus = (json['subMenus'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<HomeMainMenusModelEntitySubMenus>(
          e) as HomeMainMenusModelEntitySubMenus).toList();
  if (subMenus != null) {
    homeMainMenusModelEntityEntity.subMenus = subMenus;
  }
  return homeMainMenusModelEntityEntity;
}

Map<String, dynamic> $HomeMainMenusModelEntityEntityToJson(
    HomeMainMenusModelEntityEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mainMenu'] = entity.mainMenu?.toJson();
  data['subColor'] = entity.subColor;
  data['subMenus'] = entity.subMenus?.map((v) => v.toJson()).toList();
  return data;
}

extension HomeMainMenusModelEntityEntityExtension on HomeMainMenusModelEntityEntity {
  HomeMainMenusModelEntityEntity copyWith({
    HomeMainMenusModelEntityMainMenu? mainMenu,
    String? subColor,
    List<HomeMainMenusModelEntitySubMenus>? subMenus,
  }) {
    return HomeMainMenusModelEntityEntity()
      ..mainMenu = mainMenu ?? this.mainMenu
      ..subColor = subColor ?? this.subColor
      ..subMenus = subMenus ?? this.subMenus;
  }
}

HomeMainMenusModelEntityMainMenu $HomeMainMenusModelEntityMainMenuFromJson(
    Map<String, dynamic> json) {
  final HomeMainMenusModelEntityMainMenu homeMainMenusModelEntityMainMenu = HomeMainMenusModelEntityMainMenu();
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    homeMainMenusModelEntityMainMenu.label = label;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    homeMainMenusModelEntityMainMenu.value = value;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    homeMainMenusModelEntityMainMenu.icon = icon;
  }
  final List<String>? colors = (json['colors'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (colors != null) {
    homeMainMenusModelEntityMainMenu.colors = colors;
  }
  return homeMainMenusModelEntityMainMenu;
}

Map<String, dynamic> $HomeMainMenusModelEntityMainMenuToJson(
    HomeMainMenusModelEntityMainMenu entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['label'] = entity.label;
  data['value'] = entity.value;
  data['icon'] = entity.icon;
  data['colors'] = entity.colors;
  return data;
}

extension HomeMainMenusModelEntityMainMenuExtension on HomeMainMenusModelEntityMainMenu {
  HomeMainMenusModelEntityMainMenu copyWith({
    String? label,
    String? value,
    String? icon,
    List<String>? colors,
  }) {
    return HomeMainMenusModelEntityMainMenu()
      ..label = label ?? this.label
      ..value = value ?? this.value
      ..icon = icon ?? this.icon
      ..colors = colors ?? this.colors;
  }
}

HomeMainMenusModelEntitySubMenus $HomeMainMenusModelEntitySubMenusFromJson(
    Map<String, dynamic> json) {
  final HomeMainMenusModelEntitySubMenus homeMainMenusModelEntitySubMenus = HomeMainMenusModelEntitySubMenus();
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    homeMainMenusModelEntitySubMenus.label = label;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    homeMainMenusModelEntitySubMenus.value = value;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    homeMainMenusModelEntitySubMenus.icon = icon;
  }
  return homeMainMenusModelEntitySubMenus;
}

Map<String, dynamic> $HomeMainMenusModelEntitySubMenusToJson(
    HomeMainMenusModelEntitySubMenus entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['label'] = entity.label;
  data['value'] = entity.value;
  data['icon'] = entity.icon;
  return data;
}

extension HomeMainMenusModelEntitySubMenusExtension on HomeMainMenusModelEntitySubMenus {
  HomeMainMenusModelEntitySubMenus copyWith({
    String? label,
    String? value,
    String? icon,
  }) {
    return HomeMainMenusModelEntitySubMenus()
      ..label = label ?? this.label
      ..value = value ?? this.value
      ..icon = icon ?? this.icon;
  }
}