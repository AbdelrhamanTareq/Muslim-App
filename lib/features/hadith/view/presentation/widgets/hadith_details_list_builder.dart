import 'package:flutter/material.dart';

import '../../logic/cubit/hadith_cubit.dart';

class HadithDetailsListBuilder extends StatelessWidget {
  final GetSahihElbokharyDataSuccesState state;
  const HadithDetailsListBuilder({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 9, 109, 12),
                        ),
                        child: Text(
                          state.data[index].number.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        color: const Color.fromARGB(255, 9, 109, 12),
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  state.data[index].arab,
                  style: const TextStyle(
                      fontSize: 20, fontFamily: "me_quran", height: 2),
                  //textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: state.data.length);
  }
}
