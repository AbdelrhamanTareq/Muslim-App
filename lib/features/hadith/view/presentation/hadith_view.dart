
import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  @override
  void initState() {
    loadCsvFile();
    super.initState();
  }

  List<List<dynamic>> _data = [];

  loadCsvFile() async {
    final data = await rootBundle.loadString(
        "assets/hadith/sahih_al-bukhari_ahadith_mushakkala_mufassala.utf8.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(data);
    setState(() {
      _data = listData;
    });
    log("${listData[0][1]}");
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: const SafeArea(
        
        child: Text("data"),
      ),
    );
  }
}
