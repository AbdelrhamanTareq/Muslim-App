import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/injection_container.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

import '../../../../core/function.dart';
import '../../../hadith/data/local_data/hadith_local_data.dart';
import '../../../quran/data/local_data/quran_local_data.dart';
import '../../data/local_data/app_drawer_local_data.dart';
import '../logic/cubit/app_drawer_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<AppDrawerCubit>(context);
    return BlocBuilder<AppDrawerCubit, AppDrawerState>(
      builder: (context, state) {
        return Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DrawerHeader(),
                const SizedBox(
                  height: 50,
                ),
                DrawerSwitchListTile(
                  title: AppStrings.nightMode,
                  value: instance<AppDrawerLocalData>().getAppTheme(),
                  onChanged: (val) {
                    provider.changeToDarkMode(val);
                  },
                ),
                DrawerSwitchListTile(
                  title: AppStrings.enableNotifications,
                  value: state.enableNotifications,
                  onChanged: (val) {
                    provider.enableNotifications(val);
                  },
                ),
                // EDITED

                // DrawerSlider(
                //   title: "تغيير حجم خط القران",
                //   value: instance<AppDrawerLocalData>().getQuranTextSize(),
                //   onChanged: (val) {
                //     provider.changeQuranTextSize(val, context);
                //   },
                // ),

                DrawerSlider(
                  title: "تغيير حجم خط التطبيق",
                  max: 2,
                  min: 1,
                  value: instance<AppDrawerLocalData>().getAppTextSize(),
                  onChanged: (val) {
                    provider.changeAppTextSize(val);
                  },
                ),
                DrawerListTile(
                  icon: Icons.alarm,
                  name: "ضبط اعدادت مواقيت الصلاة",
                  onPressed: () {},
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: DrawerButton(
                    icon: Icons.delete_forever,
                    label: "مسح كل علامات القران",
                    onPressed: () async {
                      await instance<QuranLocalData>()
                          .removeAllQuranBookmarks();

                      showToast("تم حذف جميع العلامات في المصحف");
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: DrawerButton(
                    icon: Icons.delete_forever,
                    label: "مسح كل علامات الحديث",
                    onPressed: () async {
                      await instance<HadithLocalData>()
                          .removeAllHadithBookmarks();

                      showToast("تم حذف جميع علامات الحديث");
                    },
                  ),
                ),
                const Divider(),
                DrawerListTile(
                  icon: Icons.info_outline,
                  name: AppStrings.aboutUs,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DrawerSlider extends StatelessWidget {
  const DrawerSlider({
    super.key,
    required this.title,
    required this.onChanged,
    required this.value,
    this.min,
    this.max,
  });
  final String title;
  final double value;
  final double? min;
  final double? max;
  final Function(double)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              // style: Theme.of(context)
              //     .textTheme
              //     .bodyMedium!
              //     .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Slider.adaptive(
            value: value,
            onChanged: onChanged,
            divisions: 10,
            min: min ?? 20,
            max: max ?? 60,
          ),
        ],
      ),
    );
  }
}

class DrawerSwitchListTile extends StatelessWidget {
  const DrawerSwitchListTile({
    super.key,
    required this.onChanged,
    required this.title,
    required this.value,
  });

  final String title;
  final bool value;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
        title: Text(title), value: value, onChanged: onChanged);
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
  });

  final String name;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(icon),
        title: Text(name),
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      color: AppColors.indigo,
      child: const Center(
        //TODO add app icon
        child: Icon(
          Icons.book_rounded,
          size: 45,
          color: AppColors.white,
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  final IconData icon;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
