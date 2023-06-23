import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/features/azkar/presentation/logic/cubit/azkar_cubit.dart';

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
          return GestureDetector(
            onTap: () {
              
            },
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.gery
                  ),
                  child: Text(
                    state.data[index].category,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              },
            ),
          );
        } else {
          return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
