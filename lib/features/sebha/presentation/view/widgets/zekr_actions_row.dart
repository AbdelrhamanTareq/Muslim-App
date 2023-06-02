import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';
import 'package:vibration/vibration.dart';

class ZekrActionsRow extends StatelessWidget {
  const ZekrActionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
          ),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            BlocProvider.of<SebhaCubit>(context).add();
            
            // setState(() {
            //   if (_initValue == _maxValue) {
            //     _initValue = _maxValue;
            //   } else {
            //     _initValue++;
            //   }
            // });
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
          ),
          onPressed: () {
            BlocProvider.of<SebhaCubit>(context).reset();
            // setState(() {
            //   _initValue = 0;
            // });
          },
          child: const Icon(
            Icons.settings_backup_restore_sharp,
            size: 30,
          ),
        ),
      ],
    );
  }
}
