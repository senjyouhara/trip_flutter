import 'package:dio/dio.dart';
import 'dart:developer' as developer;

class AppLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log('➡️ [${options.method}] ${options.uri}');
    developer.log('Headers: ${options.headers}');
    developer.log('Data: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log('✅ [${response.statusCode}] ${response.requestOptions.uri}');
    developer.log('Response: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log('❌ [${err.response?.statusCode}] ${err.requestOptions.uri}');
    developer.log('Error: ${err.message}');
    handler.next(err);
  }
}
