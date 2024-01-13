import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hook_rent/config.dart';

class DioHttp {
  Dio? _client;
  BuildContext? context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internel(context);
  }

  DioHttp._internel(BuildContext context) {
    if (_client == null || this.context != context) {
      this.context = context;
      final options = BaseOptions(
          baseUrl: Config.BaseUrl,
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 3),
          extra: {"context": context});
      var client = Dio(options);
      this._client = client;
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.get(path, queryParameters: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client!.post(path, data: params, options: options);
  }

  // Future<Response<Map<String, dynamic>>> postFormData(String path,
  //     [Map<String, dynamic> params, String token]) async {
  //   var options = Options(
  //       contentType: ContentType.parse('multipart/form-data'),
  //       headers: {'Authorization': token});
  //   return await _client.post(path, data: params, options: options);
  // }
}
