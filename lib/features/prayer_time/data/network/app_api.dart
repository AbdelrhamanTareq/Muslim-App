import 'package:dio/dio.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constant.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AppServiceClient {
  static const _calendarByCityEndPoint = "calendarByCity";

  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("$_calendarByCityEndPoint/{year}/{month}?city=Cairo&country=Egypt&method=5")
  Future<PrayerTime> getPrayerTimeData(
    @Path("year") int year,
    @Path("month") int month,
    
  );
}
