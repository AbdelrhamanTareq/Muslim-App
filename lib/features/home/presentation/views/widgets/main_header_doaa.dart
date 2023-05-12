import 'package:flutter/material.dart';

class MainHeaderDoaa extends StatelessWidget {
  const MainHeaderDoaa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(8),
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Text(
        "استغفر الله العظيم الذي لا اله الا هو الحي القيوم و اتوب اليه",
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
