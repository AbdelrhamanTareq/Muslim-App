import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/features/hadith/data/models/bukhari.dart';

abstract class HadithRepo {
  Future<Either<Faliure, List<Bukhari>>> getSahihElbokharyData();
}

class HadithRepoImpl implements HadithRepo {
  @override
  Future<Either<Faliure, List<Bukhari>>> getSahihElbokharyData() async {
    try {
      final List<Bukhari> bukhariHadiths = [];
      final stringData =
          await rootBundle.loadString("assets/hadith/bukhari.json");
      final data = json.decode(stringData);

      //print(data.runtimeType);
      data.forEach(
        (e) => bukhariHadiths.add(
          Bukhari.fromJson(e),
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
