import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../logic/cubit/azkar_cubit.dart';

class AzkarMainWidget extends StatelessWidget {
  const AzkarMainWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final GetMainAzkarDataSuccess state;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.azkarDetailsPath, arguments: {
                "zkerTitle": state.data[index].category,
                "data": state.data[index].array,
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.gery),
              child: Text(
                state.data[index].category,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}
