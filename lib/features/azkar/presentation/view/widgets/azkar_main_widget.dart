import 'package:flutter/material.dart';
import 'package:muslim_app/features/azkar/data/models/azkar.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../logic/cubit/main_azkar_cubit.dart';

class AzkarMainWidget extends StatelessWidget {
  const AzkarMainWidget({
    Key? key,
    this.state,
    this.data,
  }) : super(key: key);

  final GetMainAzkarDataSuccess? state;
  final List<Azkar>? data;
  @override
  Widget build(BuildContext context) {
    if (state != null) {
      return _buildListBuilder(state!.data);
    } else {
      return _buildListBuilder(data!);
    }
  }

  GestureDetector _buildListBuilder(List<Azkar> data) {
    return GestureDetector(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.azkarDetailsPath, arguments: {
                "zkerTitle": data[index].category,
                "data": data[index].array,
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.gery),
              child: Text(
                data[index].category,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}
