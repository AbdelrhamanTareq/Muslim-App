import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/quran/presentation/logic/cubit/quran_cubit.dart';
import 'package:muslim_app/features/quran/presentation/view/quran_shrah_details.dart';

class QuranSurahsView extends StatefulWidget {
  const QuranSurahsView({super.key});

  @override
  State<QuranSurahsView> createState() => _QuranSurahsViewState();
}

class _QuranSurahsViewState extends State<QuranSurahsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedebf2),
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
                return Container(
                  // padding: EdgeInsets.all(4),
                  // color: index % 2 == 0
                  //     ? Color.fromARGB(255, 245, 224, 151)
                  //     : Color.fromARGB(255, 248, 217, 103
                  //   )
                  // ,
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuranSurahDetails(state.data[index].array, state.data[index].name),
                        )),
                    child: ListTile(
                      leading: Text(
                        state.data[index].name,
                        style: const TextStyle(
                          fontFamily: "me_quran",
                          fontSize: 22,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: FittedBox(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  " عدد آياتها",
                                  style: TextStyle(
                                    fontFamily: "me_quran",
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(state.data[index].array.length.toString(),
                                    style: const TextStyle(
                                      fontFamily: "me_quran",
                                      fontSize: 20,
                                    ))
                              ],
                            ),
                            Text(
                              (state.data[index].type).toString(),
                              style: const TextStyle(
                                fontFamily: "Uthman",
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
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
