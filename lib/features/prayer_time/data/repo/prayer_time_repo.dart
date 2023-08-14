import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/features/prayer_time/data/local_data/prayer_time_local_data.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/prayer_time/data/network/prayer_times_api.dart';

abstract class PrayerTimeRepo {
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeData(
      {required String city, required String country, required int methods});
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeDataByLatLong(
      {required String lat, required String long, required int methods});
}

class PrayerTimeRepoImpl extends PrayerTimeRepo {
  final AppServiceClient _appServiceClient;
  final PrayerTimeLocalDate _prayerTimeLocalDate;

  PrayerTimeRepoImpl(this._appServiceClient, this._prayerTimeLocalDate);
  @override
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeData(
      {required String city,
      required String country,
      required int methods}) async {
    final int year = DateTime.now().year;
    try {
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
          final data = await _appServiceClient.getPrayerTimeData(
            year,
            city,
            country,
            methods,
          );
          final mappedData = data.data;
          Map<int, Timings> prayerTimesMap = {};
          for (var element in mappedData.values) {
            for (var listElement in element) {
              _prayerTimeLocalDate.setMonthPrayerTimesLocalData(
                  // key: element.date[element].timestamp, prayerTimes: element.timings);
                  key: listElement.date.timestamp,
                  prayerTimes: listElement.timings);

              prayerTimesMap.addAll(
                  {int.parse(listElement.date.timestamp): listElement.timings});
            }
          }

          // mappedData["1"]

          // for (String key in mappedData.keys) {
          //   _prayerTimeLocalDate.setMonthPrayerTimesLocalData(
          //       // key: element.date[element].timestamp, prayerTimes: element.timings);
          //       key: mappedData[key][1].date.timestamp,
          //       prayerTimes: element.timings);
          //   prayerTimesMap
          //       .addAll({int.parse(element.date.timestamp): element.timings});
          // }

          return Right(prayerTimesMap);
        } catch (e) {
          if (e is DioException) {
            return Left(ServerFailure.fromDioError(e));
          }
          return Left(OtherFaliure());
        }
      }
      // print("data ~~====!! $data");
    } catch (e) {
      print(e.toString());
      return Left(OtherFaliure());
    }
  }

  @override
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeDataByLatLong(
      {required String lat, required String long, required int methods}) async {
    final int year = DateTime.now().year;

    try {
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
          final data = await _appServiceClient.getPrayerTimeDataByLatLong(
              year, lat, long, methods);
          final mappedData = data.data;
          Map<int, Timings> prayerTimesMap = {};
          for (var element in mappedData.values) {
            for (var listElement in element) {
              _prayerTimeLocalDate.setMonthPrayerTimesLocalData(
                  // key: element.date[element].timestamp, prayerTimes: element.timings);
                  key: listElement.date.timestamp,
                  prayerTimes: listElement.timings);

              prayerTimesMap.addAll(
                  {int.parse(listElement.date.timestamp): listElement.timings});
            }
          }
          // Map<int, Timings> prayerTimesMap = {};
          // for (var element in data.data) {
          //   _prayerTimeLocalDate.setMonthPrayerTimesLocalData(
          //       key: element.date.timestamp, prayerTimes: element.timings);
          //   prayerTimesMap
          //       .addAll({int.parse(element.date.timestamp): element.timings});
          // }

          return Right(prayerTimesMap);
        } catch (e) {
          if (e is DioException) {
            return Left(ServerFailure.fromDioError(e));
          }
          return Left(OtherFaliure());
        }
      }
    } catch (e) {
      print(e.toString());
      return Left(OtherFaliure());
    }
  }
}
