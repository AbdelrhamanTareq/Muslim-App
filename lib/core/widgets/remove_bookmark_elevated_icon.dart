import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

class RemoveBookmarkElevatedButton extends StatelessWidget {
  const RemoveBookmarkElevatedButton({
    super.key,
    required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.delete_forever),
      label: const Text(AppStrings.deleteBookmark),
    );
  }
}
