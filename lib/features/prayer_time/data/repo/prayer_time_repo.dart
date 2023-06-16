import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/features/prayer_time/data/local_data/prayer_time_local_data.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/prayer_time/data/network/app_api.dart';

abstract class PrayerTimeRepo {
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeData();
}

class PrayerTimeRepoImpl extends PrayerTimeRepo {
  final AppServiceClient _appServiceClient;
  final PrayerTimeLocalDate _prayerTimeLocalDate;

  PrayerTimeRepoImpl(this._appServiceClient, this._prayerTimeLocalDate);
  @override
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeData() async {
    final int year = DateTime.now().year;
    final int month = DateTime.now().month;
    try {
      // final data = _prayerTimeLocalDate.getMonthPrayerTimesCacheData();
      final now = DateTime.now();
      var newDate = DateTime(now.year, now.month, now.day, 09, 01, 01)
              .millisecondsSinceEpoch /
          1000;
      var newDateWithoutFractional = newDate.toStringAsFixed(0);
      int newIntDate = int.parse(newDateWithoutFractional);
      final data = _prayerTimeLocalDate.getMonthPrayerTimesLocalDataMap();
      if (data[newIntDate] != null) {
        return Right(data);
      } else {
        try {
          final data = await _appServiceClient.getPrayerTimeData(year, month);
          Map<int, Timings> prayerTimesMap = {};
          for (var element in data.data) {
            _prayerTimeLocalDate.setMonthPrayerTimesLocalData(
                key: element.date.timestamp, prayerTimes: element.timings);
            prayerTimesMap
                .addAll({int.parse(element.date.timestamp): element.timings});
          }

          return Right(prayerTimesMap);
        } catch (e) {
          if (e is DioException) {
            return Left(ServerFailure.fromDioError(e));
          }
          return Left(ServerFailure(e.toString()));
        }
      }
      // print("data ~~====!! $data");
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
