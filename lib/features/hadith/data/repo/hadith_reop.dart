import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/features/hadith/data/models/bukhari.dart';

abstract class HadithRepo {
  Future<Either<Faliure, List<Hadith>>> getSahihElbokharyData(String hadihPath);
}

class HadithRepoImpl implements HadithRepo {
  @override
  Future<Either<Faliure, List<Hadith>>> getSahihElbokharyData(String hadihPath) async {
    try {
      final List<Hadith> bukhariHadiths = [];
      final stringData =
          await rootBundle.loadString(hadihPath);
      final data = json.decode(stringData);

      //print(data.runtimeType);
      data.forEach(
        (e) => bukhariHadiths.add(
          Hadith.fromJson(e),
        ),
      );

      //final data = const CsvToListConverter().convert(stringData);
      //log("${data[0]}");
      return Right(bukhariHadiths);
    } catch (_) {
      return Left(LocalDataFaliure());
    }
  }
}
