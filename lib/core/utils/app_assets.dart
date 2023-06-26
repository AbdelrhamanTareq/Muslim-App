class AppAssets {
  AppAssets._();

  static const String _assetsPath = "assets/";
  static const String _quranPath = "$_assetsPath/quran";
  static const String _hadithPath = "$_assetsPath/hadith";
  static const String _azkarPath = "$_assetsPath/azkar";
  static const String _imageAssetsPath = "$_assetsPath/images";
  static const String _soundsAssetsPath = "$_assetsPath/sounds";
  //////////////////////////////////////////////////////

  static const quran = "$_quranPath/quran.json";
  //////////////////////////////////////////////////////
  static const azkar = "$_azkarPath/azkar.json";
  static const mainAzkar = "$_azkarPath/main_azkar.json";
  //////////////////////////////////////////////////////
  static const bukhariPath = "$_hadithPath/bukhari.json";
  static const muslimPath = "$_hadithPath/muslim.json";
  static const ahmadPath = "$_hadithPath/ahmad.json";
  static const nasaiPath = "$_hadithPath/nasai.json";
  static const malikPath = "$_hadithPath/malik.json";
  static const darimiPath = "$_hadithPath/darimi.json";
  static const tirmidziPath = "$_hadithPath/tirmidzi.json";
  static const abuDaudPath = "$_hadithPath/abu-daud.json";
  static const ibnuMajahPath = "$_hadithPath/ibnu-majah.json";
  //////////////////////////////////////////////////////
  static const quranSvgPath = "$_imageAssetsPath/quran.svg";
  static const compassSvgPath = "$_imageAssetsPath/compass.svg";
  static const hadithSvgPath = "$_imageAssetsPath/hadith.svg";
  static const seb7aSvgPath = "$_imageAssetsPath/seb7a.svg";
  static const alarmSvgPath = "$_imageAssetsPath/alarm.svg";
  ////////////////////////////////////////////////////////
  static const compassPath = "$_imageAssetsPath/compass.png";
  static const neddleKabahPath = "$_imageAssetsPath/qibla.png";
  static const dayImagePath = "$_imageAssetsPath/day.jpg";
  static const nightImagePath = "$_imageAssetsPath/night.jpg";
  static const quranBorder = "$_imageAssetsPath/border.png";

  ////////////////////////////////////////////////////////
  static const clickSoundPath = "$_soundsAssetsPath/click.mp3";
}
