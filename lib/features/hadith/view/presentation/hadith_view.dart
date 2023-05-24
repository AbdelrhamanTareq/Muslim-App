import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/hadith/view/logic/cubit/hadith_cubit.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  @override
  void initState() {
    BlocProvider.of<HadithCubit>(context).getSahihElbokharyData();
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
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              state.data[index]["number"].toString(),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share),
                            ),
                          ],
                        ),
                        Text(
                          state.data[index]["arab"],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.data.length);
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