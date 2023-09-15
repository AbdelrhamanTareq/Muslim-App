import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(),
          const SizedBox(
            height: 50,
          ),
          DrawerSwitchListTile(
            title: AppStrings.nightMode,
            value: false,
            onChanged: (val) {},
          ),
          DrawerSwitchListTile(
            title: AppStrings.enableNotifications,
            value: false,
            onChanged: (val) {},
          ),
          DrawerListTile(
            icon: Icons.settings,
            name: AppStrings.settings,
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          DrawerListTile(
            icon: Icons.info_outline,
            name: AppStrings.aboutUs,
            onPressed: () {},
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
      height: MediaQuery.of(context).size.height * 0.3,
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
