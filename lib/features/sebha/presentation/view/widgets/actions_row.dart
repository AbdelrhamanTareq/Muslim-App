import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';

class ActionsRow extends StatelessWidget {
  const ActionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SebhaCubit, SebhaState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconWidget(
                icon: Icons.vibration,
                color: (state.isVibrationEnalbe) ? Colors.black : Colors.grey,
                onPressed: () {
                  BlocProvider.of<SebhaCubit>(context).enableVibrate();
                },
              ),
              IconWidget(
                color: (state.isMusicEnalbe) ? Colors.black : Colors.grey,
                icon: Icons.music_note,
                onPressed: () {
                  //TODO implment music sound and adjust sound assets
                  BlocProvider.of<SebhaCubit>(context).enableMusic();
                },
              ),
            ],
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
        icon: Icon(icon) // Icons.vibration),
        );
  }
}
