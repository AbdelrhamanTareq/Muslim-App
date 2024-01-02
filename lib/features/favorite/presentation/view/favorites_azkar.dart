import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

class FavoritesAzkar extends StatelessWidget {
  const FavoritesAzkar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.favoriteZaker,
        ),
      ),
    );
  }
}
