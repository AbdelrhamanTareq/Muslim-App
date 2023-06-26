import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';

class ZekrActionsRow extends StatelessWidget {
  const ZekrActionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildButton(
          icon: Icons.add,
          onPressed: () {
            BlocProvider.of<SebhaCubit>(context).add(context);
             BlocProvider.of<SebhaCubit>(context).startMusicSound();
          },
        ),
        _buildButton(
          icon: Icons.restart_alt,
          onPressed: () => BlocProvider.of<SebhaCubit>(context).reset(),
        ),
      ],
    );
  }

  ElevatedButton _buildButton(
      {required IconData icon, required void Function() onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        elevation: 5,
        shape: const CircleBorder(),
        
        padding: const EdgeInsets.all(16),
      ),
      child: Icon(
        icon,
        size: 40,
      ),
      onPressed: () async {
        onPressed();
      },
    );
  }
}
