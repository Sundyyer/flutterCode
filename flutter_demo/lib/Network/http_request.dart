
import 'package:dio/dio.dart';
import 'http_config.dart';
import 'package:flutter_demo/Pages/Home/Model/home_model.dart';

class HttpRequest {

  BaseOptions options = BaseOptions(
    baseUrl: BASEURL,
  );
  static final dio = Dio();

  /// 请求数据接口
  static Future<home_model> request(String url, { String method = "get", Map<String, dynamic>? params } ) async {

    // Options opti = Options(method: method, extra: params);
    try {

      final response = await dio.request(url,queryParameters: {"key": KEY});
      final data = response.data;

      return home_model.fromJson(data);

    } catch(error) {
      throw error;
    }
  }


}