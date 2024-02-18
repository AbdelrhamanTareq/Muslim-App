import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/core/constant/app_constatnt.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/core/errors/erros.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:muslim_app/features/hadith/data/models/hadith.dart';

abstract class HadithRepo {
  Future<Either<Faliure, List<Hadith>>> getHadithDatabyBookName(
      String bookname);
  Future<Either<Faliure, bool>> addHadithsBooksToDatabase();
}

class HadithRepoImpl implements HadithRepo {
  @override
  Future<Either<Faliure, List<Hadith>>> getHadithDatabyBookName(
      String bookname) async {
    try {
      List<Hadith> data = [];
      final box = Hive.box(bookname);
      log("${box.values.first}");
      for (var e in box.values) {
        data.add(e);
      }
    
      return Right(data);
    } catch (_) {
      return Left(LocalDataFaliure());
    }
  }

  @override
  Future<Either<Faliure, bool>> addHadithsBooksToDatabase() async {
    try {
      // if (instance<AppLocalData>()
      //         .getIsFirstTimeLoadingSettingHadithDataToDatabase() !=
      //     false) {
      //   return const Right(true);
      // } else
      {
        await _addHadithBooktoDatabase(
            bookName: bukhariBookKey, path: AppAssets.bukhariPath);
        await _addHadithBooktoDatabase(
            bookName: musilmBookKey, path: AppAssets.muslimPath);
        await _addHadithBooktoDatabase(
            bookName: ahmedBookKey, path: AppAssets.ahmadPath);
        await _addHadithBooktoDatabase(
            bookName: abuDaudBookKey, path: AppAssets.abuDaudPath);
        await _addHadithBooktoDatabase(
            bookName: malekBookKey, path: AppAssets.malikPath);
        await _addHadithBooktoDatabase(
            bookName: nasaiBookKey, path: AppAssets.nasaiPath);
        await _addHadithBooktoDatabase(
            bookName: darimiBookKey, path: AppAssets.darimiPath);
        await _addHadithBooktoDatabase(
            bookName: tirmidziBookKey, path: AppAssets.tirmidziPath);
        await _addHadithBooktoDatabase(
            bookName: ibnuMajahBookKey, path: AppAssets.ibnuMajahPath);
        instance<AppLocalData>()
            .setIsFirstTimeLoadingSettingHadithDataToDatabase();
        return const Right(true);
      }
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
    final box = Hive.box(bookName);
    for (var element in hadith) {
      box.put(element.number, element);
    }
  }
}
