import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';
import 'package:muslim_app/features/sebha/presentation/view/widgets/zeker_count_dialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ZekrIndictor extends StatelessWidget {
  const ZekrIndictor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var _theme = context.theme;
    var _digitColor = _theme.shadowColor;
    var _digitStyle = _theme.textTheme.labelMedium.copyWith(color: _digitColor);

    return BlocBuilder<SebhaCubit, SebhaState>(
      builder: (context, state) {
        return CircularPercentIndicator(
          progressColor: AppColors.indigo,
          radius: 100.0,
          lineWidth: 10.0,
          percent: state.initValue / state.maxValue,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                state.initValue.toInt().toString(),
                style: _digitStyle,
              ),
              const Divider(
                thickness: 2,
              ),
              InkWell(
                onTap: () async {
                  final resulat = await showDialog(
                    context: context,
                    builder: (context) {
                      return const ZekerCountDialogWidget();
                    },
                  );
                  if (context.mounted) {
                    BlocProvider.of<SebhaCubit>(context).changeMaxValue(
                        (resulat != null)
                            ? double.tryParse(resulat) ?? 0
                            : state.maxValue);
                  }
                },
                child: Text(
                  state.maxValue.toInt().toString(),
                  style: _digitStyle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
