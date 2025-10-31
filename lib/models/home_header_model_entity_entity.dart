import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'home_header_model_entity_entity.g.dart';

@JsonSerializable()
class HomeHeaderModelEntityEntity  {
  String? label;
      String? value;
  String? icon;

  HomeHeaderModelEntityEntity({
    this.label,
    this.value,
    this.icon,
  });

  factory HomeHeaderModelEntityEntity.fromJson(Map<String, Object?> json) =>
      _$HomeHeaderModelEntityEntityFromJson(json);
  Map<String, dynamic> toJson() => _$HomeHeaderModelEntityEntityToJson(this);


  @override
  String toString() {
    return jsonEncode(this);
  }

}
