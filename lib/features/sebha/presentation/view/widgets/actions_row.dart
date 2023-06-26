import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';

class ActionsRow extends StatelessWidget {
  const ActionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SebhaCubit, SebhaState>(
      builder: (context, state) {
        return Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconWidget(
                  icon: Icons.vibration,
                  color: (state.isVibrationEnalbe)
                      ? AppColors.indigo
                      : AppColors.grey,
                  onPressed: () {
                    BlocProvider.of<SebhaCubit>(context).enableVibrate();
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconWidget(
                  color:
                      (state.isMusicEnalbe) ? AppColors.indigo : AppColors.grey,
                  icon: Icons.music_note,
                  onPressed: () {
                    BlocProvider.of<SebhaCubit>(context).enableMusic();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final Color color;
  const IconWidget({
    required this.icon,
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 35,
      color: color,
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
