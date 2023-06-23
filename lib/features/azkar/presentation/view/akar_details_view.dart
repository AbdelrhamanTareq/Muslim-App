// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';

import 'package:muslim_app/features/azkar/data/models/azkar.dart';

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
      backgroundColor: AppColor.scaffoldColor,
      appBar: AppBar(
       // backgroundColor: AppColor.scaffoldColor,
        title: Text(zkerTitle),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            margin: (index == 0 || index == data.length - 1)
                ? const EdgeInsets.only(top: 15, bottom: 15,left: 5,right: 5)
                : const EdgeInsets.only(bottom: 10,left: 5,right: 5),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index].text,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontFamily: "me_quran",
                        ),
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
                        "عدد مرات التكرار ${data[index].count}",
                        style:
                            const TextStyle(color: Colors.green, fontSize: 16),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.pinkAccent,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                        color: Colors.amberAccent,
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
