import 'package:dio/dio.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constant.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AppServiceClient {
  static const _calendarByCityEndPoint = "calendarByCity";
  static const _calendarByLatLongEndPoint = "calendar";

  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("$_calendarByCityEndPoint/{year}/{month}")
  Future<PrayerTime> getPrayerTimeData(
    @Path("year") int year,
    @Path("month") int month,
    @Query("city") String city,
    @Query("country") String country,
    @Query("method") int method,
  );

  @GET("$_calendarByLatLongEndPoint/{year}/{month}")
  Future<PrayerTime> getPrayerTimeDataByLatLong(
    @Path("year") int year,
    @Path("month") int month,
    @Query("latitude") String lat,
    @Query("longitude") String long,
    @Query("method") int method,
  );
}
