import 'package:trip_flutter/generated/json/base/json_field.dart';
import 'package:trip_flutter/generated/json/home_mainMenus_model_entity_entity.g.dart';
import 'dart:convert';
export 'package:trip_flutter/generated/json/home_mainMenus_model_entity_entity.g.dart';

@JsonSerializable()
class HomeMainMenusModelEntityEntity {
	HomeMainMenusModelEntityMainMenu? mainMenu;
	String? subColor;
	List<HomeMainMenusModelEntitySubMenus>? subMenus;

	HomeMainMenusModelEntityEntity();

	factory HomeMainMenusModelEntityEntity.fromJson(Map<String, dynamic> json) => $HomeMainMenusModelEntityEntityFromJson(json);

	Map<String, dynamic> toJson() => $HomeMainMenusModelEntityEntityToJson(this);

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

	factory HomeMainMenusModelEntityMainMenu.fromJson(Map<String, dynamic> json) => $HomeMainMenusModelEntityMainMenuFromJson(json);

	Map<String, dynamic> toJson() => $HomeMainMenusModelEntityMainMenuToJson(this);

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

	factory HomeMainMenusModelEntitySubMenus.fromJson(Map<String, dynamic> json) => $HomeMainMenusModelEntitySubMenusFromJson(json);

	Map<String, dynamic> toJson() => $HomeMainMenusModelEntitySubMenusToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}