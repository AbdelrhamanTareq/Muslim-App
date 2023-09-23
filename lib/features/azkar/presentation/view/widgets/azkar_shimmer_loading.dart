import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/themes/app_colors.dart';

class AzkarLoading extends StatelessWidget {
  const AzkarLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 15,
        separatorBuilder: (context, index) => const SizedBox(
              height: 3,
            ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: AppColors.indigo,
            highlightColor: Colors.indigoAccent,
            child: const Card(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Padding(
                padding: EdgeInsets.all(20),
              ),
            ),
          );
        });
  }
}