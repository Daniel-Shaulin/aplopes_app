import 'dart:convert';

import 'package:aplopes_app/src/models/exception/exception_model.dart';
import 'package:aplopes_app/src/pages/auth/result/auth_result.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

abstract class HttpMethods{
  static const String post = 'POST';
  static const String get = 'GET';
  static const String delete = 'DELETE';
  static const String put = 'PUT';
}



class HttpManager {
  Future<Map> restRequest({required String url,
    required String method,
    Map? headers,
    Map? body,
    String? applicationType,
    String? token = '',
    int? connectTimeout = 30 * 1000,
    int? receiveTimeout = 60 * 1000,
  }) async{

    BaseOptions baseOptions = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout
    );
    Dio dio = Dio(baseOptions);
    //Headers
    final defaultHeaders = headers?.cast<String, String>() ?? {}..addAll({
        'content-type': applicationType ?? 'application/json',
        'accept':'application/json',
        'Authorization':token ?? ('Bearer ${token!}')
    });
    try{
      //chamada de endpoint
     Response response = await dio.request(
        url,
        options: Options(method: method,
          headers: defaultHeaders, ),
        data: body,

      );
     return response.data;
     //tratamento de erro
    } on DioError catch(error){
      return error.response?.data ?? {};
    }catch(error){
      return {};
    }
  }
}