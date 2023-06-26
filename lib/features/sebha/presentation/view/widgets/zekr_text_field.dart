import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

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
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.black),
        decoration: const InputDecoration(hintText: AppStrings.zekerName),
      ),
    );
  }
}
