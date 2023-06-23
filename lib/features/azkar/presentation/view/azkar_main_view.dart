// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:muslim_app/features/azkar/presentation/logic/cubit/azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/view/widgets/azkar_main_widget.dart';

class AzkarMainView extends StatelessWidget {
  const AzkarMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        if (state is GetAzkarDataError) {
          // TODO
          return Text("error");
        } else if (state is GetAzkarDataSuccess) {
          return AzkarMainWidget(
            state: state,
          );
        } else {
          return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
