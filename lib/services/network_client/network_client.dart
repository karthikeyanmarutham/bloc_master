

import 'package:bloc_master_framework/constant/constant.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  var _dio = Dio();

 Dio  get networkClient {
    BaseOptions? baseOptions = BaseOptions(baseUrl: Constant.baseUrl, headers: {});

    _dio.options.baseUrl = Constant.baseUrl;
    // dio.options.connectTimeout = 5000; // milliseconds
    _dio.options.contentType = Headers.jsonContentType;
    _dio = Dio(baseOptions);

    return _dio;
  }
}