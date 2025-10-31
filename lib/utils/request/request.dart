import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:io' as io;

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_mock_interceptor/dio_mock_interceptor.dart';
import 'package:trip_flutter/utils/request/cookie_interceptor.dart';
import 'package:trip_flutter/utils/request/resp_interceptor.dart';
import 'package:flutter/services.dart';

import '../../models/base_model_entity.dart';
import 'api_exception.dart';
import 'auth_interceptor.dart';
import 'dio_client.dart';
import 'log_interceptor.dart';

// 定义转换器回调
typedef TransformerCallback<T> = T Function(Object? json);

class Request {

  static final Dio _dio = DioClient().dio;

  Request._();

  static Future<BaseModelEntity<T>> get<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    required T Function(Object? json) fromJsonT,
  }) {
    return _request<T>(
      url,
      "GET",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      fromJsonT: fromJsonT,
    );
  }

  static Future<BaseModelEntity<T>> post<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T Function(Object? json) fromJsonT,
  }) {
    return _request<T>(
      url,
      "POST",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      fromJsonT: fromJsonT,
    );
  }

  static Future<BaseModelEntity<T>> put<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    required T Function(Object? json) fromJsonT,
  }) {
    return _request<T>(
      url,
      "PUT",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      fromJsonT: fromJsonT,
    );
  }

  static Future<BaseModelEntity<T>> delete<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required T Function(Object? json) fromJsonT,
  }) {
    return _request<T>(
      url,
      "DELETE",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      fromJsonT: fromJsonT,
    );
  }

  static Future<BaseModelEntity<T>> download<T>(
    String url, {
    String? method = "GET",
    Object? data,
    dynamic? savePath,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    required T Function(Object? json) fromJsonT,
  }) {
    return _request<T>(
      url,
      "DOWNLOAD",
      savePath: savePath,
      method: method,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      fromJsonT: fromJsonT,
    );
  }

  static Future<BaseModelEntity<T>> _request<T>(
    String url,
    String type, {
    String? method,
    dynamic? savePath,
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T Function(Object? json) fromJsonT,
  }) async {

    Response response;

    try {

      if (type == "GET") {
        response = await _dio.get(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
      } else if (type == "PUT") {
        response = await _dio.put(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
      } else if (type == "DELETE") {
        response = await _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      } else if (type == "DOWNLOAD") {
        response = await _dio.download(
          url,
          savePath!,
          data: data,
          queryParameters: queryParameters,
          options: (options ?? Options()).copyWith(
            responseType: options?.responseType ?? ResponseType.bytes,
            // followRedirects: false,
            method: options?.method ?? method,
          ),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
      } else {
        response = await _dio.post(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
      }

      var model = BaseModelEntity<T>();
      if (url.startsWith("http")) {
        if (![
          ResponseType.json,
          ResponseType.plain,
        ].contains(response.requestOptions.responseType)) {
          return model;
        }
      }

      Map<String, dynamic> jsonData = json.decode(response.data);

      final isBasicType =
          T == String || T == int || T == double || T == bool || T == Uint8List;
      final isBaseListType = _isBaseTypeList(jsonData['data']);
      if (isBasicType) {
        model.data = jsonData['data'];
        return model;
      } else {
        return BaseModelEntity<T>.fromJson(jsonData, fromJsonT);
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }

  }

  static ApiException _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return ApiException('连接超时');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return ApiException('响应超时');
    } else if (e.response != null) {
      return ApiException(e.response?.data['message'] ?? '服务器错误',
          code: e.response?.statusCode);
    } else {
      return ApiException('未知错误: ${e.message}');
    }
  }

  static bool _isBaseTypeList<T>(dynamic data) {
    // 快速检查：如果不是列表类型，直接返回 false
    if (data is! List) return false;

    // 使用更高效的类型检查替代字符串解析
    final firstElement = data.isNotEmpty ? data.first : null;

    return firstElement is String ||
        firstElement is int ||
        firstElement is double ||
        firstElement is bool;
  }
}
