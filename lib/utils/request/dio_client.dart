import 'dart:io';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_mock_interceptor/dio_mock_interceptor.dart';

import 'auth_interceptor.dart';
import 'cookie_interceptor.dart';
import 'log_interceptor.dart';
import 'resp_interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio dio;

  static String _baseUrl = "";

  // 单位秒
  static int _timeout = 300;

  DioClient._internal() {
    dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: Duration(seconds: _timeout),
      sendTimeout: Duration(seconds: _timeout),
      receiveTimeout: Duration(seconds: _timeout),
      baseUrl: _baseUrl,
      // method: method ?? type,
    );

    dio.interceptors.addAll([
      AuthInterceptor(
        getToken: _getToken,
        onTokenExpired: _handleTokenExpired,
      ),
      AppLogInterceptor(),
      // CookieInterceptor(),
      MyResponseInterceptor(),
      MockInterceptor(),
    ]);
  }


  static void initAdapter(Dio dio) {
    // 是否允许不良证书
    var allowBadCert = true;
    // 是否使用受信任的根证书。
    var withTrustedRoots = true;
    // 受信任的证书列表。
    List<ByteData> trustedCertificates = const [];
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.findProxy = (url) {
        return "PROXY 192.168.0.102:8888";
      };
      // 设置不良证书的回调函数，允许不良证书时返回 true 。
      client.badCertificateCallback = (cert, host, port) {
        return allowBadCert;
      };
      // 如果允许不良证书，直接返回创建的客户端。
      if (allowBadCert) {
        return client;
      }
      // 否则，创建一个  SecurityContext ，并设置受信任的证书。
      SecurityContext securityContext = SecurityContext(
        withTrustedRoots: withTrustedRoots,
      );
      for (var certificateBytes in trustedCertificates) {
        securityContext.setTrustedCertificatesBytes(
          certificateBytes.buffer.asUint8List(),
        );
      }
      io.HttpClient httpClient = io.HttpClient(context: securityContext);
      return httpClient;
    };
  }

  Future<String?> _getToken() async {
    // TODO: 从缓存/本地获取 Token
    return 'mock_token_123';
  }

  Future<void> _handleTokenExpired() async {
    // TODO: 刷新 Token 或跳转登录页
  }
}