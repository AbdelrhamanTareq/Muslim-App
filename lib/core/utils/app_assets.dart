const String assetsPath = "assets/";
const String quranPath = "assets/quran";
const String hadithPath = "assets/hadith";
const String azkarPath = "assets/azkar";
const String imageAssetsPath = "assets/images";

abstract class AppAssets {
  static const quran = "$quranPath/quran.json";
  //////////////////////////////////////////////////////
  static const azkar = "$azkarPath/azkar.json";
  static const mainAzkar = "$azkarPath/main_azkar.json";
  //////////////////////////////////////////////////////
  static const bukhariPath = "$hadithPath/bukhari.json";
  static const muslimPath = "$hadithPath/muslim.json";
  static const ahmadPath = "$hadithPath/ahmad.json";
  static const nasaiPath = "$hadithPath/nasai.json";
  static const malikPath = "$hadithPath/malik.json";
  static const darimiPath = "$hadithPath/darimi.json";
  static const tirmidziPath = "$hadithPath/tirmidzi.json";
  static const abuDaudPath = "$hadithPath/abu-daud.json";
  static const ibnuMajahPath = "$hadithPath/ibnu-majah.json";
  //////////////////////////////////////////////////////
  static const quranSvgPath = "$imageAssetsPath/quran.svg";
  static const compassSvgPath = "$imageAssetsPath/compass.svg";
  static const hadithSvgPath = "$imageAssetsPath/hadith.svg";
  static const seb7aSvgPath = "$imageAssetsPath/seb7a.svg";
  static const alarmSvgPath = "$imageAssetsPath/alarm.svg";
  ////////////////////////////////////////////////////////
  static const compassPath = "$imageAssetsPath/compass.png";
  static const neddleKabahPath = "$imageAssetsPath/qibla.png";
  static const dayImagePath = "$imageAssetsPath/day.jpg";
  static const nightImagePath = "$imageAssetsPath/night.jpg";
  static const quranBorder = "$imageAssetsPath/border.png";
  
}