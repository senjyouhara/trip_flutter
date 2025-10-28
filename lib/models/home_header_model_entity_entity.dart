import 'package:trip_flutter/generated/json/base/json_field.dart';
import 'package:trip_flutter/generated/json/home_header_model_entity_entity.g.dart';
import 'dart:convert';
export 'package:trip_flutter/generated/json/home_header_model_entity_entity.g.dart';

@JsonSerializable()
class HomeHeaderModelEntityEntity {
	String? label;
	String? value;
	String? icon;

	HomeHeaderModelEntityEntity();

	factory HomeHeaderModelEntityEntity.fromJson(Map<String, dynamic> json) => $HomeHeaderModelEntityEntityFromJson(json);

	Map<String, dynamic> toJson() => $HomeHeaderModelEntityEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}