import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constant.dart';

class DioFactory {
  static const int _timeOut = 1000;
  Future<Dio> initDio() async {
    final Dio dio = Dio();

    Map<String, dynamic> headers = {
      //ApiConstant.contentType: ApiConstant.applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      headers: headers,
      sendTimeout: const Duration(milliseconds: _timeOut),
      receiveTimeout: const Duration(milliseconds: _timeOut),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }
}
