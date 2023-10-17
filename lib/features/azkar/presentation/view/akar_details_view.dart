// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

import 'package:muslim_app/features/azkar/data/models/azkar.dart';
import 'package:share_plus/share_plus.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({
    Key? key,
    required this.zkerTitle,
    required this.data,
  }) : super(key: key);

  final String zkerTitle;
  final List<Array> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(zkerTitle),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.white,
            margin: (index == 0 || index == data.length - 1)
                ? const EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5)
                : const EdgeInsets.only(bottom: 10, left: 5, right: 5),
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    data[index].text,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.black,fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${AppStrings.numberOfZeker}${data[index].count}",
                        style:
                            const TextStyle(color: AppColors.green, fontSize: 16),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                        color: AppColors.error,
                      ),
                      IconButton(
                        onPressed: () {
                          Share.share(data[index].text);
                        },
                        icon: const Icon(Icons.share),
                        color: AppColors.indigo,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
