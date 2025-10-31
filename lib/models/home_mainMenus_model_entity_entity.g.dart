// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_mainMenus_model_entity_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMainMenusModelEntityEntity _$HomeMainMenusModelEntityEntityFromJson(
  Map<String, dynamic> json,
) => HomeMainMenusModelEntityEntity()
  ..mainMenu = json['mainMenu'] == null
      ? null
      : HomeMainMenusModelEntityMainMenu.fromJson(
          json['mainMenu'] as Map<String, dynamic>,
        )
  ..subColor = json['subColor'] as String?
  ..subMenus = (json['subMenus'] as List<dynamic>?)
      ?.map(
        (e) => HomeMainMenusModelEntitySubMenus.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList();

Map<String, dynamic> _$HomeMainMenusModelEntityEntityToJson(
  HomeMainMenusModelEntityEntity instance,
) => <String, dynamic>{
  'mainMenu': instance.mainMenu,
  'subColor': instance.subColor,
  'subMenus': instance.subMenus,
};

HomeMainMenusModelEntityMainMenu _$HomeMainMenusModelEntityMainMenuFromJson(
  Map<String, dynamic> json,
) => HomeMainMenusModelEntityMainMenu()
  ..label = json['label'] as String?
  ..value = json['value'] as String?
  ..icon = json['icon'] as String?
  ..colors = (json['colors'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList();

Map<String, dynamic> _$HomeMainMenusModelEntityMainMenuToJson(
  HomeMainMenusModelEntityMainMenu instance,
) => <String, dynamic>{
  'label': instance.label,
  'value': instance.value,
  'icon': instance.icon,
  'colors': instance.colors,
};

HomeMainMenusModelEntitySubMenus _$HomeMainMenusModelEntitySubMenusFromJson(
  Map<String, dynamic> json,
) => HomeMainMenusModelEntitySubMenus()
  ..label = json['label'] as String?
  ..value = json['value'] as String?
  ..icon = json['icon'] as String?;

Map<String, dynamic> _$HomeMainMenusModelEntitySubMenusToJson(
  HomeMainMenusModelEntitySubMenus instance,
) => <String, dynamic>{
  'label': instance.label,
  'value': instance.value,
  'icon': instance.icon,
};
