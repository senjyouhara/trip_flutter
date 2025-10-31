// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModelEntity<T> _$BaseModelEntityFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => BaseModelEntity<T>()
  ..errorMsg = json['error_msg'] as String?
  ..errorCode = (json['error_code'] as num?)?.toInt()
  ..data = fromJsonT(json['data']);

Map<String, dynamic> _$BaseModelEntityToJson<T>(
  BaseModelEntity<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'error_msg': instance.errorMsg,
  'error_code': instance.errorCode,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
