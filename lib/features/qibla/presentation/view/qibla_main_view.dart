import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class QiblaMainView extends StatefulWidget {
  const QiblaMainView({super.key});

  @override
  State<QiblaMainView> createState() => _QiblaMainViewState();
}

class _QiblaMainViewState extends State<QiblaMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.black45,
      appBar: AppBar(
        title: const Text(AppStrings.qibla),
      ),
      body: Center(
        child: SmoothCompass(
          compassSupportText: AppStrings.compassSupportText,
          allowLocationText: AppStrings.allowLocationText,
          allowLocationFromSettingsAndPrivacyText:
              AppStrings.allowLocationFromSettingsAndPrivacyText,
          allowPermissionText: AppStrings.allowLocationText,
          openSettingsText: AppStrings.openSettingsText,
          enableLocationText: AppStrings.enableLocationText,
          locationServicesDisabledText: AppStrings.locationServicesDisabledText,
          locationServicesPermentDeniedText:
              AppStrings.locationServicesPermentDeniedText,
          isQiblahCompass: true,
          compassBuilder: (context, compassData, compassAsset) {
            return AnimatedRotation(
              turns: compassData?.data?.turns ?? 0 / 360,
              duration: const Duration(milliseconds: 400),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        AppAssets.compassPath,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: -20,
                      left: 50,
                      right: 0,
                      bottom: 40,
                      child: AnimatedRotation(
                        turns: (compassData?.data?.qiblahOffset ?? 0) / 360,
                        duration: const Duration(milliseconds: 400),
                        child: Image.asset(
                          AppAssets.neddleKabah1Path,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
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
