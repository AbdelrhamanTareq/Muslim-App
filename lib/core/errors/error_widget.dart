import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    Key? key,
    required this.error,
    this.retryFunciton,
  }) : super(key: key);

  final String error;
  final Function()? retryFunciton;

  @override
  Widget build(BuildContext context) {
    // const appBarHeight = kToolbarHeight;
    // const bottomNavHeight = kBottomNavigationBarHeight;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Card(
        // width: screenWidth * 0.7,
        // height: screenHeight * 0.4,

        color: AppColors.white,
        elevation: 10,
        // borderRadius: BorderRadius.circular(16),

        // padding: const EdgeInsets.fromLTRB(10, 40, 10, 2),
        child: SizedBox(
          width: screenWidth * 0.7,
          height: screenHeight * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.error_rounded,
                  color: AppColors.error,
                  size: 40,
                ),
                Text(
                  error,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                TextButton(
                  onPressed: retryFunciton ??
                      () {
                        // instance<HomeCubit>().getHomeData();
                      },
                  child: Text(
                    AppStrings.retry,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
