import 'package:flutter/material.dart';
import 'package:muslim_app/core/themes/app_colors.dart';
import 'package:muslim_app/core/utils/app_assets.dart';
import 'package:muslim_app/core/utils/app_router.dart';
import 'package:muslim_app/features/hadith/data/models/hadith_screen_object.dart';

import '../../features/home/data/models/screen_object.dart';

const backgroundColrors = [
  Color(0xff61b3de),
  Color(0xffa1e3df),
  Color(0xffffe980),
  Color(0xff0e3042),
  Color(0xff86abb8),
];

const appListStrings = [
  "القران الكريم",
  "الحديث",
  "مواقيت الصلاة",
  "الاذكار",
  "السبحة الالكترونية",
];

const appHomeIcons = [
  AppAssets.quranSvgPath,
  AppAssets.hadithSvgPath,
  AppAssets.alarmSvgPath,
  AppAssets.compassSvgPath,
  AppAssets.seb7aSvgPath,
];

List<ScreenObject> appScreen = [
  ScreenObject(
    color: AppColors.quranBackgroundAppBar,
    name: "القران الكريم",
    path: Routes.quranPath,
    iconAsset: AppAssets.quranSvgPath,
  ),
  ScreenObject(
    color: const Color(0xffa1e3df),
    name: "الحديث",
    path: Routes.hadithPath,
    iconAsset: AppAssets.hadithSvgPath,
  ),
  ScreenObject(
    color: const Color(0xffffe980),
    name: "مواقيت الصلاة",
    path: Routes.prayerTimePath,
    iconAsset: AppAssets.alarmSvgPath,
  ),
  ScreenObject(
    color: const Color(0xff0e3042),
    name: "القبلة",
    path: Routes.qiblaPath,
    iconAsset: AppAssets.compassSvgPath,
  ),
  ScreenObject(
    color: const Color(0xff86abb8),
    name: "السبحة الالكترونية",
    path: Routes.sebhaPath,
    iconAsset: AppAssets.seb7aSvgPath,
  ),
];

List<HadithScreenObject> hadithBooks = [
  HadithScreenObject(name: "صحيح البخاري", path: AppAssets.bukhariPath),
  HadithScreenObject(name: "صحيح مسلم", path: AppAssets.muslimPath),
  HadithScreenObject(name: "سنن ابن ماجه", path: AppAssets.ibnuMajahPath),
  HadithScreenObject(name: "سنن ابي دواد", path: AppAssets.abuDaudPath),
  HadithScreenObject(name: "سنن الترمذي", path: AppAssets.tirmidziPath),
  HadithScreenObject(name: "الموطأ", path: AppAssets.malikPath),
  HadithScreenObject(name: "سنن النسائي", path: AppAssets.nasaiPath),
  HadithScreenObject(name: "سنن ابن ماجه", path: AppAssets.ibnuMajahPath),
  HadithScreenObject(name: "مسند احمد", path: AppAssets.ahmadPath),
];

const String bookmarksKey = "BOOKMARK";
const String prayerTimesKey = "PRAYER_TIMES";
