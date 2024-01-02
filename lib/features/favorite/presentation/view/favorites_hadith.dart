import 'package:flutter/material.dart';

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
    );
  }
}
