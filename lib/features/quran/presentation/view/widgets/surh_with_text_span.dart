import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/data/app_local_data.dart';
import 'package:muslim_app/core/function.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/core/utils/arabic_num_converter.dart';
import 'package:muslim_app/features/app_drawer/data/local_data/app_drawer_local_data.dart';
import 'package:muslim_app/features/app_drawer/presentation/logic/cubit/app_drawer_cubit.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/models/quran.dart';

class SurhWithTextSpan extends StatefulWidget {
  const SurhWithTextSpan({
    super.key,
    required List<Array> surahAyat,
    required ScrollController scrollController,
    required String surhName,
  })  : _scrollController = scrollController,
        _surhName = surhName,
        _surahAyat = surahAyat;

  final List<Array> _surahAyat;
  final ScrollController _scrollController;
  final String _surhName;

  @override
  State<SurhWithTextSpan> createState() => _SurhWithTextSpanState();
}

class _SurhWithTextSpanState extends State<SurhWithTextSpan> {
  _x(context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Theme.of(context).textTheme.apply(
          fontSizeDelta: instance<AppDrawerLocalData>().getQuranTextSize());
    });
  }

  @override
  void initState() {
    super.initState();
    instance<AppDrawerLocalData>().getQuranTextSize();
    print(
        "initStateSize = ${instance<AppDrawerLocalData>().getQuranTextSize()}");
    _x(context);
  }

  @override
  Widget build(BuildContext context) {
    // print(
    //     "initStateSize = ${instance<AppDrawerLocalData>().getQuranTextSize()}");
    // print("fontSize");
    // print(Theme.of(context).textTheme.displayMedium!.fontSize);
    return BlocBuilder<AppDrawerCubit, AppDrawerState>(
      builder: (context, state) {
        return Text.rich(
          TextSpan(
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: instance<AppDrawerLocalData>().getQuranTextSize()),
            // style: TextStyle(
            //   fontSize: instance<AppDrawerLocalData>().getQuranTextSize(),
            //   color: Colors.black,
            //   fontFamily: "Hafs"
            // ),
            children: widget._surahAyat
                .map(
                  (e) => TextSpan(
                    children: [
                      TextSpan(
                          text: e.ar,
                          recognizer: TapGestureRecognizer()
                            ..onTapDown = (details) {
                              var globalPositionDx = details.globalPosition.dx;
                              var globalPositionDy = details.globalPosition.dy;
                              showMenu(
                                elevation: 10,
                                context: context,
                                position: RelativeRect.fromLTRB(
                                  globalPositionDx - 10,
                                  globalPositionDy - 10,
                                  globalPositionDx,
                                  globalPositionDy,
                                ),
                                items: [
                                  PopupMenuItem(
                                    padding: EdgeInsets.zero,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                await instance<AppLocalData>()
                                                    .setBookmarkedNames(
                                                        key: widget._surhName,
                                                        value: [
                                                      widget._surhName,
                                                      widget._scrollController
                                                              .offset +
                                                          details.globalPosition
                                                              .distance,
                                                    ]);
                                                showToast(
                                                    AppStrings.addedBookmark);
                                                if (context.mounted) {
                                                  Navigator.pop(context);
                                                }
                                              },
                                              icon: const Icon(Icons.bookmark),
                                            ),
                                            const Text(AppStrings.bookmark)
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Share.share(e.ar);
                                              },
                                              icon: const Icon(Icons.share),
                                            ),
                                            const Text(AppStrings.share)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                      TextSpan(
                        text: e.id.toArabicNumbers,
                        // text: "\uFD3F${e.id.toArabicNumbers}\uFD3E",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: instance<AppDrawerLocalData>()
                                    .getQuranTextSize()),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          // style: TextStyle(fontSize: 35, color: Colors.black, wordSpacing: 2),
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
