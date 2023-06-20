import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim_app/features/azkar/data/models/azkar.dart';

import '../../../../core/utils/app_assets.dart';

abstract class AzkarRepo {
  Future<List<Azkar>> getAzkarDate();
}

class AzkarRepoImpl extends AzkarRepo {
  @override
  Future<List<Azkar>> getAzkarDate() async {
    final List<Azkar> azkarData = [];

    final stringData = await rootBundle.loadString(AppAssets.azkar);
    List<Map<String, dynamic>> data = (jsonDecode(stringData) as List).cast();

    for (var element in data) {
      final quran = Azkar.fromJson(element);
      azkarData.add(quran);
    }
    return azkarData;
  }
}
