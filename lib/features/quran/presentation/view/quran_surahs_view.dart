import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/quran/presentation/logic/cubit/quran_cubit.dart';

class QuranSurahsView extends StatefulWidget {
  const QuranSurahsView({super.key});

  @override
  State<QuranSurahsView> createState() => _QuranSurahsViewState();
}

class _QuranSurahsViewState extends State<QuranSurahsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is QuranGetAllDataError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is QuranGetAllDataSucces) {
            return ListView.separated(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    state.data[index].name,
                    style: const TextStyle(
                        fontFamily: "Uthman",
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: FittedBox(
                    child: Column(
                      children: [
                       const Text(
                          "عدد اياتها",
                          style:  TextStyle(
                            fontFamily: "Uthman",
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          (state.data[index].array.length).toString(),
                          style: const TextStyle(
                            fontFamily: "Uthman",
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      )),
    );
  }
}
