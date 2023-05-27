import 'package:flutter/material.dart';
import 'package:muslim_app/features/quran/data/local_data/quran_local_data.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../core/injection_container.dart';
import '../../logic/cubit/hadith_cubit.dart';

class HadithDetailsListBuilder extends StatelessWidget {
  final GetSahihElbokharyDataSuccesState state;
  const HadithDetailsListBuilder(
      {super.key, required this.state, required this.itemScrollController,required this.name});

  final ItemScrollController itemScrollController;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.separated(
        itemScrollController: itemScrollController,
        itemBuilder: (context, index) {
//           final contentSize = _scrollController.position.viewportDimension +
//               _scrollController.position.maxScrollExtent;
// // Index to scroll to.
//           final index = 100;
// // Estimate the target scroll position.
//           final target = contentSize * index / state.data.length;
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
                        onPressed: () {
                          instance<QuranLocalData>().setBookMarkedName(
                              name: name, key: "HADITH_BOOKMARKED_NAME");
                          instance<QuranLocalData>().setBookmark(
                              value: index.toDouble(), key: "HADITH_BOOKMARK");
                          // _itemScrollController.scrollTo(
                          //     index: 30,
                          //     duration: const Duration(milliseconds: 300),
                          //     curve: Curves.easeIn);
                          // _scrollController.position.animateTo(
                          //   target,
                          //   duration: const Duration(seconds: 2),
                          //   curve: Curves.easeInOut,
                          // );
                        },
                        icon: const Icon(Icons.bookmark),
                      ),
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
        separatorBuilder: (context, i) => const Divider(),
        itemCount: state.data.length);
  }
}
