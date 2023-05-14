
import 'package:flutter/material.dart';

class QuranSurahsView extends StatefulWidget {
  const QuranSurahsView({super.key});

  @override
  State<QuranSurahsView> createState() => _QuranSurahsViewState();
}

class _QuranSurahsViewState extends State<QuranSurahsView> {
  

  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SafeArea(
          child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text("quranData[index].name"),
            trailing: Text("(quranData[index].array.length).toString()"),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      )),
    );
  }
}
