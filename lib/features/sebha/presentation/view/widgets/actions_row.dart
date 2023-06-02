import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';

class ActionsRow extends StatelessWidget {
  const ActionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              BlocProvider.of<SebhaCubit>(context).enableVibrate();
              HapticFeedback.vibrate();
            },
          ),
          IconWidget(
            icon: Icons.music_note,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  const IconWidget({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 35,
        color: Colors.grey,
        onPressed: onPressed,
        icon: Icon(icon) // Icons.vibration),
        );
  }
}
