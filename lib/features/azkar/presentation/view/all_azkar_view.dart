// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/azkar/data/models/azkar.dart';
import 'package:muslim_app/features/azkar/presentation/view/widgets/azkar_main_widget.dart';

class AllAzkarView extends StatelessWidget {
  const AllAzkarView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Azkar> data;

  @override
  Widget build(BuildContext context) {
    print(data.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allAzkar),
      ),
      body: SingleChildScrollView(child: AzkarMainWidget(data: data)),
    );
  }
}
