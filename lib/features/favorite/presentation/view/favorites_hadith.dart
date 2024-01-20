import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Center(child: Text(state.error));
        } else if (state is GetFavoriteHadithLoadedState) {
          return Column(
            children: [Text(state.favHadithModel.hadithData)],
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
