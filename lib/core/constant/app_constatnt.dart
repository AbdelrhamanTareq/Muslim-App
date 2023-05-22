import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/app_assets.dart';

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
    color: const Color(0xff61b3de),
    name: "القران الكريم",
    path: "/quran",
    iconAsset: AppAssets.quranSvgPath,
  ),
  ScreenObject(
    color: const Color(0xffa1e3df),
    name: "الحديث",
    path: "/hadith",
    iconAsset: AppAssets.hadithSvgPath,
  ),
  ScreenObject(
    color: const Color(0xffffe980),
    name: "البوصلة",
    path: "/prayer-time",
    iconAsset: AppAssets.alarmSvgPath,
  ),
  ScreenObject(
    color: const Color(0xff0e3042),
    name: "الاذكار",
    path: "/azhar",
    iconAsset: AppAssets.compassSvgPath,
  ),
  ScreenObject(
    color: const Color(0xff86abb8),
    name: "السبحة الالكترونية",
    path: "/sebha",
    iconAsset: AppAssets.seb7aSvgPath,
  ),
];
