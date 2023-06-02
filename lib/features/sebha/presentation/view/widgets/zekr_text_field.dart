import 'package:flutter/material.dart';

class ZkerTextFiled extends StatelessWidget {
  const ZkerTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: TextFormField(
        initialValue: "سبحان الله",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontFamily: "me_quran",
        ),
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Color.fromARGB(113, 36, 243, 17),
              ),
            ),
            hintText: "اسم الذكر"),
      ),
    );
  }
}
