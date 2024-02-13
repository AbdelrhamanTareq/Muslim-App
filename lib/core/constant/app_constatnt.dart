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

// TODO make colors and string in app strings and app colors

List<ScreenObject> appScreen = [
  ScreenObject(
    color: AppColors.quranBackgroundAppBar,
    name: "القران الكريم",
    path: Routes.quranPath,
    iconAsset: AppAssets.quranSvgPath,
  ),
  ScreenObject(
    color: AppColors.hadithContainerColor,
    //color: AppColors.indigo,
    name: "الحديث",
    path: Routes.hadithPath,
    iconAsset: AppAssets.hadithSvgPath,
  ),
  ScreenObject(
    color: const Color(0xff61b3de),
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
  HadithScreenObject(name: "صحيح البخاري", databaseKey: bukhariBookKey),
  HadithScreenObject(name: "صحيح مسلم", databaseKey: musilmBookKey),
  HadithScreenObject(name: "سنن ابن ماجه", databaseKey: ibnuMajahBookKey),
  HadithScreenObject(name: "سنن ابي دواد", databaseKey: abuDaudBookKey),
  HadithScreenObject(name: "سنن الترمذي", databaseKey: tirmidziBookKey),
  HadithScreenObject(name: "الموطأ", databaseKey: malekBookKey),
  HadithScreenObject(name: "سنن النسائي", databaseKey: nasaiBookKey),
  HadithScreenObject(name: "سنن ابن ماجه", databaseKey: ibnuMajahBookKey),
  HadithScreenObject(name: "مسند احمد", databaseKey: ahmedBookKey),
];

const String bukhariBookKey = "BUKHARI";
const String musilmBookKey = "MUSLIM";
const String ahmedBookKey = "AHMED";
const String abuDaudBookKey = "ABU_DAUD";
const String malekBookKey = "MALEK";
const String nasaiBookKey = "NASAI";
const String darimiBookKey = "DARIMI";
const String tirmidziBookKey = "TIRMIDZ";
const String ibnuMajahBookKey = "IBNU_MAJAH";

const String bookmarksKey = "BOOKMARK";
const String prayerTimesKey = "PRAYER_TIMES";
const String favoriteKey = "FOVRITE";
const String hadithKey = "HADITH";

const List<Map<String, String>> prayerTimesMethods = [
  {
    "en": "Shia Ithna Ashari",
    "ar": "الشيعة الاثنا عشرية",
  },
  {
    "en": "University of Islamic Sciences, Karachi",
    "ar": "جامعة العلوم الإسلامية، كراتشي",
  },
  {
    "en": "Islamic Society of North America",
    "ar": "الجمعية الإسلامية لأمريكا الشمالية",
  },
  {
    "en": "Muslim World League",
    "ar": "رابطة العالم الإسلامي",
  },
  {
    "en": "Umm Al-Qura University, Makkah",
    "ar": "جامعة أم القرى، مكة المكرمة",
  },
  {
    "en": "Egyptian General Authority of Survey",
    "ar": "الهيئة المصرية العامة للمساحة",
  },
  {
    "en": "Institute of Geophysics, University of Tehran",
    "ar": "معهد الجيوفيزياء ، جامعة طهران",
  },
  {
    "en": "Gulf Region",
    "ar": "منطقة الخليج",
  },
];

const int scrollDuration = 300;
const Cubic curvesType = Curves.easeIn;
const double appBarLeftPadding = 8.0;
