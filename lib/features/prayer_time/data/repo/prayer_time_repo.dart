import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/features/prayer_time/data/local_data/prayer_time_local_data.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/prayer_time/data/network/prayer_times_api.dart';
import 'package:muslim_app/features/prayer_time/presentation/view/widgets/prayer_country_picker_view.dart';

abstract class PrayerTimeRepo {
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeData({
    required String city,
    required String country,
    required int methods,
  });
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeDataByLatLong({
    required String lat,
    required String long,
    required int methods,
  });
}

class PrayerTimeRepoImpl extends PrayerTimeRepo {
  final AppServiceClient _appServiceClient;
  final PrayerTimeLocalDate _prayerTimeLocalDate;

  PrayerTimeRepoImpl(this._appServiceClient, this._prayerTimeLocalDate);
  final String _yearly = RadioChoice.yearly.name;
  // final String _monthly = RadioChoice.monthly.name;
  @override
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeData({
    required String city,
    required String country,
    required int methods,
  }) async {
    final int year = DateTime.now().year;
    try {
      int newIntDate = _getNewIntDate();
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
          Map<int, Timings> prayerTimesMap = _mapPrayerTimesData(mappedData);

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

  @override
  Future<Either<Faliure, Map<int, Timings>>> getPrayerTimeDataByLatLong(
      {required String lat, required String long, required int methods}) async {
    final int year = DateTime.now().year;
    final int month = DateTime.now().month;

    try {
      int newIntDate = _getNewIntDate();
      final data = _prayerTimeLocalDate.getMonthPrayerTimesLocalDataMap();
      if (data[newIntDate] != null) {
        return Right(data);
      } else {
        try {
          var data;
          data = (_choosePrayerTimesGetterPeriodMethod() == _yearly)
              ? await _appServiceClient.getPrayerTimeDataByLatLong(
                  year,
                  lat,
                  long,
                  methods,
                )
              : await _appServiceClient.getMonthlyPrayerTimeDataByLatLong(
                  year,
                  month,
                  lat,
                  long,
                  methods,
                );
          final mappedData = data.data;
          Map<int, Timings> prayerTimesMap = _mapPrayerTimesData(mappedData);

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

  int _getNewIntDate() {
    final now = DateTime.now();
    var newDate = DateTime(now.year, now.month, now.day, 09, 01, 01)
            .millisecondsSinceEpoch /
        1000;
    var newDateWithoutFractional = newDate.toStringAsFixed(0);
    int newIntDate = int.parse(newDateWithoutFractional);
    return newIntDate;
  }

  Map<int, Timings> _mapPrayerTimesData(Map<String, List<Data>> mappedData) {
    Map<int, Timings> prayerTimesMap = {};
    for (var element in mappedData.values) {
      for (var listElement in element) {
        _prayerTimeLocalDate.setMonthPrayerTimesLocalData(
          // key: element.date[element].timestamp, prayerTimes: element.timings);
          key: listElement.date.timestamp,
          prayerTimes: listElement.timings,
        );

        prayerTimesMap.addAll(
            {int.parse(listElement.date.timestamp): listElement.timings});
      }
    }
    return prayerTimesMap;
  }

  String _choosePrayerTimesGetterPeriodMethod() {
    return instance<PrayerTimeLocalDate>().getPrayerTimesDataGetterPeriod();
  }
}
