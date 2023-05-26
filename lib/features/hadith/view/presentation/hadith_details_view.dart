import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';

import 'widgets/hadith_details_list_builder.dart';

class HadithDetailsView extends StatefulWidget {
  final String hadihPath;
  const HadithDetailsView({super.key,required this.hadihPath});

  @override
  State<HadithDetailsView> createState() => _HadithDetailsViewState();
}

class _HadithDetailsViewState extends State<HadithDetailsView> {
  @override
  void initState() {
    BlocProvider.of<HadithCubit>(context).getSahihElbokharyData(widget.hadihPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("صحيح البخاري"),
      ),
      body: SafeArea(
        child: BlocBuilder<HadithCubit, HadithState>(
          builder: (context, state) {
            if (state is GetSahihElbokharyDataErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is GetSahihElbokharyDataSuccesState) {
              return HadithDetailsListBuilder(
                state: state,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}
