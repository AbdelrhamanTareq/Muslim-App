import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time.dart';
import 'package:muslim_app/features/prayer_time/data/network/app_api.dart';

abstract class PrayerTimeRepo {
  Future<Either<Faliure, PrayerTime>> getPrayerTimeData();
}

class PrayerTimeRepoImpl extends PrayerTimeRepo {
  final AppServiceClient _appServiceClient;

  PrayerTimeRepoImpl(this._appServiceClient);
  @override
  Future<Either<Faliure, PrayerTime>> getPrayerTimeData() async {
    final int year = DateTime.now().year;
    final int month = DateTime.now().month;
    try {
      final data = await _appServiceClient.getPrayerTimeData(year, month);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
