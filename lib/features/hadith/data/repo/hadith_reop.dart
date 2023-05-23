import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/core/utils/app_assets.dart';

abstract class HadithRepo {
  Future<List<dynamic>> getSahihElbokharyData();
}

class HadithRepoImpl implements HadithRepo {
  @override
  Future<List> getSahihElbokharyData() async {
    final stringData =
        await rootBundle.loadString(AppAssets.sahiahElbokharPath);

    final data = const CsvToListConverter().convert(stringData);

    return data;
  }
}
