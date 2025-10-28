import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:io' as io;

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_mock_interceptor/dio_mock_interceptor.dart';
import 'package:trip_flutter/utils/request/cookie_interceptor.dart';
import 'package:trip_flutter/utils/request/request_interceptor.dart';
import 'package:trip_flutter/utils/request/resp_interceptor.dart';
import 'package:flutter/services.dart';
import 'base_model_entity.dart';

class Request {
  static String _baseUrl = "";

  // 单位秒
  static int _timeout = 300;

  Request._();

  static Future<BaseModelEntity<T>> get<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _request<T>(
      url,
      "GET",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
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
    );
  }

  static Future<BaseModelEntity<T>> put<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _request<T>(
      url,
      "PUT",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  static Future<BaseModelEntity<T>> delete<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _request<T>(
      url,
      "DELETE",
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
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
  }) async {
    Dio dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: Duration(seconds: _timeout),
      sendTimeout: Duration(seconds: _timeout),
      receiveTimeout: Duration(seconds: _timeout),
      baseUrl: _baseUrl,
      // method: method ?? type,
    );
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    // dio.interceptors.add(CookieInterceptor());
    dio.interceptors.add(MyRequestInterceptor());
    dio.interceptors.add(MyResponseInterceptor());
    // initAdapter(dio);
    dio.interceptors.add(MockInterceptor());

    Response response;

    if (type == "GET") {
      response = await dio.get(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } else if (type == "PUT") {
      response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } else if (type == "DELETE") {
      response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } else if (type == "DOWNLOAD") {
      response = await dio.download(
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
      response = await dio.post(
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
    if(url.startsWith("http")){
      if(![ResponseType.json, ResponseType.plain].contains(response.requestOptions.responseType)) {
        return model;
      }
    }

    final typeString = T.toString();
    final isBasicType = T == String || T == int || T == double || T == bool || T == Uint8List;
    final isListType = T == List || typeString.startsWith('List<');

    if(isBasicType || isListType) {
      model.data = _convertResponseData<T>(response.data);
    } else {
      model = BaseModelEntity<T>.fromJson(response.data);
    }

    return model;
  }

  static void initAdapter(Dio dio) {
    // 是否允许不良证书
    var allowBadCert = true;
    // 是否使用受信任的根证书。
    var withTrustedRoots = true;
    // 受信任的证书列表。
    List<ByteData> trustedCertificates = const [];
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = (){
      final client = HttpClient();
      client.findProxy = (url) {
        return "PROXY 192.168.0.102:8888";
      };
      // 设置不良证书的回调函数，允许不良证书时返回 true 。
      client.badCertificateCallback = (cert, host, port) {
        return allowBadCert;
      };
      // 如果允许不良证书，直接返回创建的客户端。
      if(allowBadCert){
        return client;
      }
      // 否则，创建一个  SecurityContext ，并设置受信任的证书。
      SecurityContext securityContext =
      SecurityContext(withTrustedRoots: withTrustedRoots);
      for (var certificateBytes in trustedCertificates) {
        securityContext
            .setTrustedCertificatesBytes(certificateBytes.buffer.asUint8List());
      }
      io.HttpClient httpClient = io.HttpClient(context: securityContext);
      return httpClient;
    };
  }

  static dynamic _convertResponseData<T>(dynamic responseData) {
    final typeString = T.toString();

    // 首先解析完整的响应 JSON
    dynamic parsedData;
    if (responseData is String) {
      try {
        parsedData = json.decode(responseData);
      } catch (e) {
        print('JSON decode error: $e');
        return responseData;
      }
    } else {
      parsedData = responseData;
    }

    // 检查是否是 BaseModelEntity 结构
    if (parsedData is Map<String, dynamic>) {
      // 提取 data 字段
      final responseDataField = parsedData['data'];

      if (typeString.startsWith('List<')) {
        if (responseDataField is List) {
          // 提取泛型类型
          final genericType = typeString.substring(5, typeString.length - 1);
          if (genericType == 'String') {
            return responseDataField.cast<String>();
          } else if (genericType == 'int') {
            return responseDataField.cast<int>();
          } else if (genericType == 'double') {
            return responseDataField.cast<double>();
          } else if (genericType == 'bool') {
            return responseDataField.cast<bool>();
          }
        }
      }

      // 如果不是列表类型，返回整个 data 字段
      return responseDataField;
    }

    return responseData;
  }
}
