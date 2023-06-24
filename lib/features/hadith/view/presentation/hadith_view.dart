import 'package:flutter/material.dart';
import 'package:muslim_app/core/constant/app_constatnt.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_router.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.hadith),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: hadithBooks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // TODO make map object
                Navigator.pushNamed(context, Routes.hadithDeatilsPath,
                    arguments: {"bookPath":hadithBooks[index].path, "bookName":hadithBooks[index].name});
              },
              child: Container(
                //width: MediaQuery.of(context).size.width * 0.4,
                //height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.auto_stories,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      hadithBooks[index].name,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
