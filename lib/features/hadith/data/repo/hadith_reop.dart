import 'dart:convert';
import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/core/utils/app_assets.dart';

abstract class HadithRepo {
  Future<Either<Faliure, List<dynamic>>> getSahihElbokharyData();
}

class HadithRepoImpl implements HadithRepo {
  @override
  Future<Either<Faliure, List<dynamic>>> getSahihElbokharyData() async {
    try {
      final stringData =
          await rootBundle.loadString("assets/hadith/bukhari.json");
          final data = json.decode(stringData);

      //final data = const CsvToListConverter().convert(stringData);
     log("${data[0]}");
      return Right(data);
    } catch (_) {
      return Left(LocalDataFaliure());
    }
  }
}
