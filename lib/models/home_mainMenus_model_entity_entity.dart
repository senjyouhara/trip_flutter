import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'home_mainMenus_model_entity_entity.g.dart';

@JsonSerializable()
class HomeMainMenusModelEntityEntity {
	HomeMainMenusModelEntityMainMenu? mainMenu;
	String? subColor;
	List<HomeMainMenusModelEntitySubMenus>? subMenus;

	HomeMainMenusModelEntityEntity();

	factory HomeMainMenusModelEntityEntity.fromJson(Map<String, dynamic> json) => _$HomeMainMenusModelEntityEntityFromJson(json);

	Map<String, dynamic> toJson() => _$HomeMainMenusModelEntityEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeMainMenusModelEntityMainMenu {
	String? label;
	String? value;
	String? icon;
	List<String>? colors;

	HomeMainMenusModelEntityMainMenu();

	factory HomeMainMenusModelEntityMainMenu.fromJson(Map<String, dynamic> json) => _$HomeMainMenusModelEntityMainMenuFromJson(json);

	Map<String, dynamic> toJson() => _$HomeMainMenusModelEntityMainMenuToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeMainMenusModelEntitySubMenus {
	String? label;
	String? value;
	String? icon;

	HomeMainMenusModelEntitySubMenus();

	factory HomeMainMenusModelEntitySubMenus.fromJson(Map<String, dynamic> json) => _$HomeMainMenusModelEntitySubMenusFromJson(json);

	Map<String, dynamic> toJson() => _$HomeMainMenusModelEntitySubMenusToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

