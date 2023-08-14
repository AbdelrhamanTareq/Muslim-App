import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'prayer_times_api_constant.dart';

class DioFactory {
  static const int _timeOut = 1000;
  Future<Dio> initDio() async {
    final Dio dio = Dio();

    Map<String, dynamic> headers = {"Content-Type": "application/json"};

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
