import 'package:dio/dio.dart';

class DioHelper
{
  static Dio dio = Dio();

  static init()
  {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response?> getData({
    required url,
    query,
    String lang = 'en',
    var token,
  })async
  {
    dio.options.headers = {
      'lang' : lang,
      'Content-Type' : 'application/json',
      'Authorization' : token??'',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required url,
    query,
    required Map<String, dynamic> data,
    String lang = 'en',
    token,
}) async
  {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token,
    };
    return await dio.post(
        url,
        queryParameters: query,
        data: data,
    );
  }

  static Future<Response> putData({
    required url,
    query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    token,
  }) async
  {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token,
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}