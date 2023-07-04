// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/errors/error_widget.dart';

import 'package:muslim_app/features/azkar/presentation/logic/cubit/main_azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/view/widgets/azkar_main_widget.dart';

class AzkarMainView extends StatelessWidget {
  const AzkarMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainAzkarCubit, MainAzkarState>(
      builder: (context, state) {
        if (state is GetMainAzkarDataError) {
          
          return AppErrorWidget(
            error: state.error,
          );
        } else if (state is GetMainAzkarDataSuccess) {
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
