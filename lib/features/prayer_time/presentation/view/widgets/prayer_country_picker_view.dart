import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:muslim_app/core/functions.dart';
import 'package:muslim_app/core/injection_container.dart';

import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';
import 'package:muslim_app/core/utils/app_router.dart';
import 'package:muslim_app/core/utils/app_strings.dart';
import 'package:muslim_app/features/prayer_time/data/local_data/prayer_time_local_data.dart';
import 'package:muslim_app/features/prayer_time/data/models/prayer_time_object.dart';
import 'package:muslim_app/features/prayer_time/presentation/logic/cubit/prayer_time_cubit.dart';

import '../../../../../core/constant/app_constatnt.dart';

class PrayerCountryPickerView extends StatelessWidget {
  const PrayerCountryPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final blackColor = context.blackLightColor;
    final whiteColor = context.whiteLightColor;
    final provider = BlocProvider.of<PrayerTimeCubit>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(
                        context, AppStrings.selectUpdatePrayerTimesPriod),
                    const ConstHegithSizedBox(),
                    const RadioGroup(),
                    const ConstHegithSizedBox(),
                    _buildHeader(context, AppStrings.chooseYourLocation),
                    const ConstHegithSizedBox(),
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
                    const ConstHegithSizedBox(),
                    _buildChooseLocationText(
                        context, AppStrings.getLocationManual),
                    const ConstHegithSizedBox(),
                    CSCPicker(
                      disabledDropdownDecoration:
                          BoxDecoration(color: whiteColor),
                      dropdownDecoration: BoxDecoration(color: whiteColor),
                      dropdownDialogRadius: 10,
                      searchBarRadius: 10,
                      flagState: CountryFlag.DISABLE,
                      dropdownItemStyle: TextStyle(color: blackColor),
                      dropdownHeadingStyle: TextStyle(color: blackColor),
                      selectedItemStyle: TextStyle(color: blackColor),
                      onCityChanged: (value) {
                        print("city $value");
                        provider.getCity(value ?? "");
                      },
                      onCountryChanged: (value) {
                        print("county $value");
                        provider.getCountry(value);
                      },
                      onStateChanged: (value) {
                        // print("state $value");
                        // BlocProvider.of<PrayerTimeCubit>(context).getCity(value ?? "");
                      },
                    ),
                    const ConstHegithSizedBox(),
                    _buildChooseLocationText(
                        context, AppStrings.choosePrayerTimesMethods),
                    const ConstHegithSizedBox(),
                    _buildPrayerTimesMethodsDropdownMenu(context),
                    const ConstHegithSizedBox(),
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
                        } else if ((state.country != null &&
                            state.city != null)) {
                          provider.saveCityAndCountry(
                              city: state.city!, country: state.country!);
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
                          AppFunctions.showToast(
                              AppStrings.plesasChooseYourLocation,
                              color: AppColors.error);
                        }
                      },
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

  Widget _buildPrayerTimesMethodsDropdownMenu(BuildContext context) {
    return DropdownMenu(
      initialSelection: prayerTimesMethods[4]["ar"],
      onSelected: (value) {
        int method = AppFunctions.getIndexOfPrayerTimeMethods(value!);
        BlocProvider.of<PrayerTimeCubit>(context)
            .changePrayerTimesMethods(method);
      },
      dropdownMenuEntries: prayerTimesMethods
          .map(
            (e) => DropdownMenuEntry(value: e["ar"], label: e["ar"]!),
          )
          .toList(),
    );
  }

  Text _buildHeader(BuildContext context, String text) {
    return Text(
      text,
      style: context.textThmem.headlineMedium!
          .copyWith(color: context.blackLightColor),
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
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: AppColors.indigo),
    );
  }
}

enum RadioChoice { monthly, yearly }

class RadioGroup extends StatefulWidget {
  const RadioGroup({super.key});

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  RadioChoice _radioChoice = RadioChoice.monthly;
  final RadioChoice _monthly = RadioChoice.monthly;
  final RadioChoice _yearly = RadioChoice.yearly;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRadioListTile(
          context,
          title: AppStrings.montly,
          val: _monthly,
        ),
        _buildRadioListTile(
          context,
          title: AppStrings.yearly,
          val: _yearly,
        ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 0.4,
        //   child: RadioListTile<RadioChoice>.adaptive(
        //       title: const Text(AppStrings.yearly),
        //       value: _yearly,
        //       groupValue: _radioChoice,
        //       toggleable: true,
        //       onChanged: (val) {
        //         print("object1");
        //       }),
        // ),
      ],
    );
  }

  SizedBox _buildRadioListTile(
    BuildContext context, {
    required String title,
    required RadioChoice val,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: RadioListTile<RadioChoice>.adaptive(
          title: Text(title),
          value: val,
          groupValue: _radioChoice,
          // toggleable: true,
          onChanged: (val) {
            instance<PrayerTimeLocalDate>()
                .setPrayerTimesDataGetterPeriod(val!.name);
            setState(() {
              _radioChoice = val;
            });
          }),
    );
  }
}

class ConstHegithSizedBox extends StatelessWidget {
  const ConstHegithSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}
