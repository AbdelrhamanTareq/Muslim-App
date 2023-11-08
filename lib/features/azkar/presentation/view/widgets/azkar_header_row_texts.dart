import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
import 'package:muslim_app/core/widgets/text_widget.dart';

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
          // _buildText(context, text: AppStrings.alazkar),
          TextWidget(
            text: AppStrings.alazkar,
            style: _textStyle(context),
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
                  child: TextWidget(
                    text: AppStrings.allAzkar,
                    style: _textStyle(context),
                  )
                  // _buildText(context, text: AppStrings.allAzkar),
                  // Text(
                  //   AppStrings.allAzkar,
                  //   // FOR DARK MODE
                  //   style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  //         color: Theme.of(context).shadowColor,
                  //       ),
                  // ),
                  );
            },
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle(BuildContext context) {
    return context.headlineLarge!.copyWith(
      // FOR DARK MODE
      color: context.blackLightColor,
    );
  }

  Text _buildText(BuildContext context, {required String text}) {
    return Text(
      text,
      style: context.headlineLarge!.copyWith(
        // FOR DARK MODE
        color: context.blackLightColor,
      ),
    );
  }
}
