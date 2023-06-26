import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../logic/cubit/all_azkar_cubit.dart';

class AzkarHeaderRowTexts extends StatelessWidget {
  const AzkarHeaderRowTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.alazkar,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColors.black),
          ),
          BlocBuilder<AllAzkarCubit, AllAzkarState>(
            builder: (context, state) {
              return TextButton(
                onPressed: () {
                  if (state is GetAllAzkarDataSuccess) {
                    Navigator.pushNamed(context, Routes.allAzkarPath,
                        arguments: state.data);
                  }
                },
                child: Text(
                  AppStrings.allAzkar,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.black),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
