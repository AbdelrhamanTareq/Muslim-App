import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:muslim_app/core/function.dart';

import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_router.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time_object.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';

import '../../../../../core/constant/app_constatnt.dart';

class PrayerCountryPickerView extends StatefulWidget {
  const PrayerCountryPickerView({super.key});

  @override
  State<PrayerCountryPickerView> createState() =>
      _PrayerCountryPickerViewState();
}

class _PrayerCountryPickerViewState extends State<PrayerCountryPickerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(
                  height: 16,
                ),
                _buildChooseLocationText(
                    context, AppStrings.getLocationByLocationSevice),
                const SizedBox(height: 24),
                (state.isLoadingGetLocation)
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : _buildGetLocationButton(
                        text: AppStrings.getCurrentLocation,
                        onPressed: () {
                          BlocProvider.of<PrayerTimeCubit>(context)
                              .getCurrentPosition();
                        },
                      ),
                const SizedBox(
                  height: 16,
                ),
                _buildChooseLocationText(context, AppStrings.getLocationManual),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CSCPicker(
                    //flagState: CountryFlag.DISABLE,
                    dropdownItemStyle: const TextStyle(color: Colors.black),
                    dropdownHeadingStyle: const TextStyle(color: Colors.black),
                    selectedItemStyle: const TextStyle(color: Colors.black),
                    onCityChanged: (value) {
                      print("city $value");
                      BlocProvider.of<PrayerTimeCubit>(context)
                          .getCity(value ?? "");
                    },
                    onCountryChanged: (value) {
                      print("county $value");
                      BlocProvider.of<PrayerTimeCubit>(context)
                          .getCountry(value);
                    },
                    onStateChanged: (value) {
                      // print("state $value");
                      // BlocProvider.of<PrayerTimeCubit>(context).getCity(value ?? "");
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildChooseLocationText(
                    context, AppStrings.choosePrayerTimesMethods),
                const SizedBox(
                  height: 16,
                ),
                _buildPrayerTimesMethodsDropdownMenu(),
                const SizedBox(
                  height: 16,
                ),
                _buildGetLocationButton(
                  text: AppStrings.save,
                  onPressed: () {
                    if (state.position != null) {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.prayerTimePath,
                        arguments: PrayerTimeObjcet(
                            address: state.addres,
                            lat: state.position!.latitude.toString(),
                            long: state.position!.latitude.toString()),
                      );
                    } else if ((state.country != null && state.city != null)) {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.prayerTimePath,
                        arguments: PrayerTimeObjcet(
                          city: state.city,
                          country: state.country,
                          address: Placemark(
                              country: state.country,
                              administrativeArea: state.city),
                        ),
                      );
                    } else {
                      showToast("من فضلك اختار موقعك", color: AppColors.error);
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Padding _buildPrayerTimesMethodsDropdownMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownMenu(
        initialSelection: prayerTimesMethods[4]["ar"],
        onSelected: (value) {
          int method = getIndexOfPrayerTimeMethods(value!);
          BlocProvider.of<PrayerTimeCubit>(context)
              .changePrayerTimesMethods(method);
        },
        dropdownMenuEntries: prayerTimesMethods
            .map(
              (e) => DropdownMenuEntry(value: e["ar"], label: e["ar"]!),
            )
            .toList(),
      ),
    );
  }

  Text _buildHeader(BuildContext context) {
    return Text(
      AppStrings.chooseYourLocation,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: AppColors.black),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildGetLocationButton(
      {required String text, required void Function()? onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: ElevatedButton(
          // style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }

  Widget _buildChooseLocationText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.indigo),
      ),
    );
  }
}
