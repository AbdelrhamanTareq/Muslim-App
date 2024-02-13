import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/core/constant/app_constatnt.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:muslim_app/features/hadith/data/models/hadith.dart';

abstract class HadithRepo {
  Future<Either<Faliure, List<Hadith>>> getSahihElbokharyData(String hadihPath);
  //TODO make methoed invoke whem app start
  Future<Either<Faliure, bool>> addHadithsBooksToDatabase();
}

class HadithRepoImpl implements HadithRepo {
  static const String _bukhariBookKey = "BUKHARI";
  static const String _musilmBookKey = "MUSLIM";
  static const String _ahmedBookKey = "AHMED";
  static const String _abuDaudBookKey = "ABU_DAUD";
  static const String _malekBookKey = "MALEK";
  static const String _nasaiBookKey = "NASAI";
  static const String _darimiBookKey = "DARIMI";
  static const String _tirmidziBookKey = "TIRMIDZ";
  static const String _ibnuMajahBookKey = "IBNU_MAJAH";

  @override
  Future<Either<Faliure, List<Hadith>>> getSahihElbokharyData(
      String hadihPath) async {
    try {
      final List<Hadith> bukhariHadiths = [];
      final stringData = await rootBundle.loadString(hadihPath);
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

  @override
  Future<Either<Faliure, bool>> addHadithsBooksToDatabase() async {
    try {
      await _addHadithBooktoDatabase(
          bookName: _bukhariBookKey, path: AppAssets.bukhariPath);
      await _addHadithBooktoDatabase(
          bookName: _musilmBookKey, path: AppAssets.muslimPath);
      await _addHadithBooktoDatabase(
          bookName: _ahmedBookKey, path: AppAssets.ahmadPath);
      await _addHadithBooktoDatabase(
          bookName: _abuDaudBookKey, path: AppAssets.abuDaudPath);
      await _addHadithBooktoDatabase(
          bookName: _malekBookKey, path: AppAssets.malikPath);
      await _addHadithBooktoDatabase(
          bookName: _nasaiBookKey, path: AppAssets.nasaiPath);
      await _addHadithBooktoDatabase(
          bookName: _darimiBookKey, path: AppAssets.darimiPath);
      await _addHadithBooktoDatabase(
          bookName: _tirmidziBookKey, path: AppAssets.tirmidziPath);
      await _addHadithBooktoDatabase(
          bookName: _ibnuMajahBookKey, path: AppAssets.ibnuMajahPath);
      return const Right(true);
    } catch (e) {
      return Left(LocalDataFaliure());
    }

    // print(Hive.box(hadithKey).get(_musilmBookKey));
  }

  Future<void> _addHadithBooktoDatabase(
      {required String path, required String bookName}) async {
    final stringData = await rootBundle.loadString(path);
    final data = json.decode(stringData);
    final List<Hadith> hadith = [];

    data.forEach(
      (e) => hadith.add(
        Hadith.fromJson(e),
      ),
    );
    final box = Hive.box(hadithKey);
    box.put(bookName, hadith);
  }
}
