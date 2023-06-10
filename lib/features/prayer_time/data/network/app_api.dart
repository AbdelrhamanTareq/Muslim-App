import 'package:dio/dio.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constant.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("calendarByCity/2023/6?city=Cairo&country=Egypt&method=2")
  Future<PrayerTime> getPrayerTimeData();
}
