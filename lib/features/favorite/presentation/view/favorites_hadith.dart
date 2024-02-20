import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/errors/error_widget.dart';
import 'package:muslim_app/core/themes/texts_styles.dart';

import 'package:muslim_app/features/favorite/presentation/logic/cubit/favorite_cubit.dart';

import '../../../../core/utils/app_strings.dart';

class FavoritesHadith extends StatelessWidget {
  const FavoritesHadith({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.favoriteHadith,
        ),
      ),
      body:
          BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
        if (state is GetFavoriteHadithErrorState) {
          return AppErrorWidget(
            error: state.error,
            retryFunciton: () {
              //TODO
            },
          );
        } else if (state is GetFavoriteHadithEmptyState) {
          return const Center(
            child: Text(AppStrings.noFavHadithsYet),
          );
        } else if (state is GetFavoriteHadithLoadedState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(12.0),

                //   // border: Border.all(
                //   //   color: Colors.red,
                //   // )
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        state.favHadithModel[index].hadithData,
                        style: AppTextsStyles.quranTextStyle(),
                      ),
                      Row(
                        children: [
                          Text(state.favHadithModel[index].hadithBook),
                          const Spacer(),
                          Text(
                              "حديث رقم ${state.favHadithModel[index].hadithNumber}"),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: state.favHadithModel.length,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      }),
    );
  }
}
