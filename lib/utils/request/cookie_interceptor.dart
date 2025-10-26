
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../constants/Sp_constants.dart';
import '../../service/shared_preferences_service.dart';

class CookieInterceptor extends Interceptor {

  final SharedPreferencesService spService = Get.find();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
    var cookies = await spService.getStringList(SpConstants.cookies) ?? [];

    if(!options.path.endsWith("/user/login") && cookies.length > 0){
      options.headers[HttpHeaders.cookieHeader] = cookies;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {

    if(response.requestOptions.path.endsWith("/user/login")){
      dynamic setCookies = response.headers[HttpHeaders.setCookieHeader];
      List<String> cookies = [];
      if(setCookies is List){
        for(String? cookie in setCookies){
          print("cookie interceptor cookie: ${cookie}");
          if(cookie?.isNotEmpty == true){
              cookies.add(cookie!);
          }
        }
      }
      if(cookies.length > 0){
        await spService.setStringList(SpConstants.cookies, cookies);
      }
    }

    handler.next(response);

  }


}