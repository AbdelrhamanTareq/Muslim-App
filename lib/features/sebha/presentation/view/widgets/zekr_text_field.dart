import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
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
        style: context.theme.textTheme.bodyMedium!
            .copyWith(color: context.theme.shadowColor),
        decoration: const InputDecoration(hintText: AppStrings.zekerName),
      ),
    );
  }
}
