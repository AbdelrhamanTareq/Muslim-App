import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim_app/core/utils/app_assets.dart';

import '../models/quran.dart';

abstract class QuranRepo {
  Future<List<Quran>> getAllQuranData();
}

class QuranRepoImpl implements QuranRepo {
  @override
  Future<List<Quran>> getAllQuranData() async {
    final List<Quran> quranData = [];

    final stringData = await rootBundle.loadString(AppAssets.quran);
    List<Map<String, dynamic>> data = (jsonDecode(stringData) as List).cast();

    data.forEach((element) {
      final quran = Quran.fromJson(element);
      quranData.add(quran);
    });
    return quranData;
  }
}
