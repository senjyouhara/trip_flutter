import 'package:trip_flutter/generated/json/base/json_convert_content.dart';
import 'package:trip_flutter/models/home_header_model_entity_entity.dart';

HomeHeaderModelEntityEntity $HomeHeaderModelEntityEntityFromJson(
    Map<String, dynamic> json) {
  final HomeHeaderModelEntityEntity homeHeaderModelEntityEntity = HomeHeaderModelEntityEntity();
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    homeHeaderModelEntityEntity.label = label;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    homeHeaderModelEntityEntity.value = value;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    homeHeaderModelEntityEntity.icon = icon;
  }
  return homeHeaderModelEntityEntity;
}

Map<String, dynamic> $HomeHeaderModelEntityEntityToJson(
    HomeHeaderModelEntityEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['label'] = entity.label;
  data['value'] = entity.value;
  data['icon'] = entity.icon;
  return data;
}

extension HomeHeaderModelEntityEntityExtension on HomeHeaderModelEntityEntity {
  HomeHeaderModelEntityEntity copyWith({
    String? label,
    String? value,
    String? icon,
  }) {
    return HomeHeaderModelEntityEntity()
      ..label = label ?? this.label
      ..value = value ?? this.value
      ..icon = icon ?? this.icon;
  }
}