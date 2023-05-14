import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/quran.dart';

abstract class QuranRepo {
  Future<void> getAllQuranData();
}

class QuranRepoImpl implements QuranRepo {
  @override
  Future<void> getAllQuranData() async {
    final List<Quran> quranData = [];

    final stringData = await rootBundle.loadString("assets/quran/quran.json");
    List<Map<String, dynamic>> data = (jsonDecode(stringData) as List).cast();

    data.forEach((element) {
      final quran = Quran.fromJson(element);
      quranData.add(quran);
    });
  }
}
