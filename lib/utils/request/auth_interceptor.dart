import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Future<String?> Function() getToken;
  final Future<void> Function()? onTokenExpired;

  AuthInterceptor({
    required this.getToken,
    this.onTokenExpired,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && onTokenExpired != null) {
      await onTokenExpired!();
    }
    handler.next(err);
  }
}