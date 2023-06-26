import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class ZekerCountDialogWidget extends StatelessWidget {
  const ZekerCountDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final TextEditingController controller = TextEditingController();
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.enterZekerCount,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              //  controller: controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: AppStrings.enterZekerCount,
              ),
              // onEditingComplete:()=> Navigator.pop(context),
              onSubmitted: (value) => Navigator.pop(context, value),
            ),
          ],
        ),
      ),
    );
  }
}