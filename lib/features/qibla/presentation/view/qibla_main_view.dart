import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';
import 'package:smooth_compass/utils/src/widgets/error_widget.dart';

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
          errorDecoration: ErrorDecoration(
            permissionMessage: PermissionMessage(
              denied: AppStrings.locationServicesDeniedText,
              permanentlyDenied: AppStrings.locationServicesPermentDeniedText,
            ),
            buttonText: ButtonText(
              onPermissionDenied: AppStrings.locationServicesDisabledText,
              onLocationDisabled: AppStrings.enableLocationText,
              onPermissionPermanentlyDenied:
                  AppStrings.locationServicesPermentDeniedText,
            ),
          ),
          isQiblahCompass: true,
          compassBuilder: (context, compassData, compassAsset) {
            return AnimatedRotation(
              turns: compassData?.data?.turns ?? 0 / 360,
              duration: const Duration(milliseconds: 400),
              child: SizedBox(
                height: 300,
                // height: MediaQuery.of(context).size.height * 0.7,
                width: 300,
                // width: MediaQuery.of(context).size.width * 0.7,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      left: 0,
                      bottom: 0,
                      child: Image.asset(
                        AppAssets.compassPath,
                        fit: BoxFit.fill,
                      ),
                    ),

                    AnimatedRotation(
                      turns: (compassData?.data?.qiblahOffset ?? 0) / 360,
                      duration: const Duration(milliseconds: 400),
                      child: Positioned(
                        right: 0,
                        top: 20,
                        left: 0,
                        bottom: 20,
                        child: Image.asset(
                          AppAssets.neddleKabah1Path,
                          fit: BoxFit.fitHeight,
                        ),

                        // child: AnimatedRotation(
                        //   turns: (compassData?.data?.qiblahOffset ?? 0) / 360,
                        //   duration: const Duration(milliseconds: 400),
                        //   child: Image.asset(
                        //     AppAssets.neddleKabah1Path,
                        //     fit: BoxFit.fitHeight,
                        //   ),
                        // ),
                      ),
                    ),
                    // child: AnimatedRotation(
                    //   turns: (compassData?.data?.qiblahOffset ?? 0) / 360,
                    //   duration: const Duration(milliseconds: 400),
                    //   child: Image.asset(

                    //     AppAssets.neddleKabah1Path,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
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
