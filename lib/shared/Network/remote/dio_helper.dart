import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio ;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({
  @required String Url, @required Map<String, dynamic> Quary
  })async
  {
  return await dio.get(Url,queryParameters: Quary);
  }
}