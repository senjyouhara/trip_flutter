import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'base_model_entity.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  fieldRename: FieldRename.snake,
)
class BaseModelEntity<T> {
  String? errorMsg;
  int? errorCode;
  T? data;

  BaseModelEntity();

  factory BaseModelEntity.fromJson(
    Map<String, Object?> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) => _$BaseModelEntityFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseModelEntityToJson(this, toJsonT);


  @override
  String toString() {
    return jsonEncode(this);
  }

}
