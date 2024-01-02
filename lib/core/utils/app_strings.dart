abstract class AppStrings {
  const AppStrings._();

  static const String noRouteFound = "لم يتم العثور علي هذة الصفحة";
  static const String retry = "حاول مرة اخري";

  //////////////////////////////////////////////////////////////

  static const String holyQuran = "القران الكريم";
  static const String noBookmark = "لا يوجد علامة في هذة الصورة";
  static const String noOfAyat = "عدد آياتها";
  static const String bookmark = "علامة";
  static const String share = "مشاركة";
  static const String changeAyatSize = "تغيير حجم الايات";
  /////////////////////////////////////////////////
  static const String hadith = "الأحاديث";
  static const String noBookmarkHadith = "لا يوجد علامة في هذا الكتاب";
  static const String addedBookmark = "تم اضافة علامة";
  /////////////////////////////////////////////////
  static const String numberOfTasbeehReached = "تم الوصول للعدد المطلوب";
  static const String enableClickSound = "تفعيل الصوت";
  static const String disableClickSound = "الغاء الصوت";
  static const String enableVibration = "تفعيل الاهتزاز";
  static const String disableVibration = "الغاء الاهتزاز";
  ///////////////////////////////////////////////////

  static const String qibla = "القبلة";
  static const String compassSupportText = "هذا الجهاز لا يدعم البوصلة";
  static const String enableLocationText = "تفعيل الموقع";
  static const String locationServicesDisabledText =
      "خدمة الموقع معطلة من فضلك فعلها";
  static const String allowLocationText =
      "يرجى السماح بأذونات الموقع للحصول على اتجاه القبلة للموقع الحالي";
  static const String allowPermissionText = "السماح بالأذونات";
  static const String openSettingsText = "الذهاب للأعدادت";
  static const String locationServicesPermentDeniedText =
      "تم رفض الموقع بشكل دائم";
  static const String locationServicesDeniedText = "تم رفض  خدمة الموقع";
  static const String allowLocationFromSettingsAndPrivacyText =
      "يرجى السماح بإذن الموقع من الإعدادات والخصوصية";
  //////////////////////////////////////////////////////////
  static const String chooseYourLocation =
      "من فضلك قم بتحديد موقعك لتحصل علي مواقيت الصلاة الخاصة بموقعك";
  static const String getLocationByLocationSevice =
      "اختيار الموقع عن طريق خدمة الموقع:";
  static const String choosePrayerTimesMethods =
      "اختار طريقة حساب مواقيت الصلاة ";
  static const String getLocationManual = "أو اختار الموقع يدويا:";
  static const String getCurrentLocation = "الحصول علي الموقع";
  static const String getCurrentManual = "حفظ الموقع المختار";
  static const String locationFounded = "تم ايجاد الموقع";
  static const String plesasChooseYourLocation = "من فضلك اختار موقعك";
  static const String selectUpdatePrayerTimesPriod =
      "اختار طريقة تحديث مواقيت الصلاة";
  static const String montly = "شهري";
  static const String yearly = "سنوي";
  static const String save = "حفظ";
  static const String fajr = "الفجر";
  static const String dhuhr = "الظهر";
  static const String asr = "العصر";
  static const String maghrib = "المغرب";
  static const String isha = "العشاء";
  static const String sunrise = "الشروق";
  static const String remaining = "متبقي";
  static const String enableSound = "تم تفعيل التنبيه";
  static const String disableSound = "تم الغاء التنبيه";

  ////////////////////////////////////////////
  static const String alazkar = "الاذكار";
  static const String allAzkar = "جميع الاذكار";
  static const String numberOfZeker = "عدد مرات التكرار ";

  /////////////////////////////////////////////////
  static const String zekerName = "اسم الذكر";
  static const String enterZekerCount = "ادخل العدد المطلوب";

  /////////////////////////////////////////////////
  static const String settings = "الاعدادت";
  static const String nightMode = "الوضع الليلي";
  static const String changeAppTextSize = "تغيير حجم خط التطبيق";
  static const String editPrayerTimesSettings = "ضبط اعدادت مواقيت الصلاة";
  static const String deleteAllQuranBookmarks = "مسح كل علامات القران";
  static const String allQuranBookmarksDeleted =
      "تم حذف جميع العلامات في المصحف";
  static const String allHadithBookmarksDeleted =
      "تم حذف جميع العلامات في كتب الحديث";
  static const String deleteAllHadithBookmarks = "مسح كل علامات الحديث";
  static const String enableNotifications = "تفعيل الاشعارات";
  static const String aboutUs = "عن المطور";
  ////////////////////////////////////////////////////

  static const String noLastRead = "لا يوجد";
  static const String lastRead = "اخر قراءة";
  static const String bookmarkDeleted = "تم حذف العلامة";
  static const String noBookmarks = "لا يوجد علامات";
  static const String deleteBookmark = "مسح العلامة";
  static const String surha = "سورة";

  ///////////////////////////////////////////////////////////
  static const String favorite = "المفضلة";
  static const String favoriteHadith = "الاحاديث المفضلة";
  static const String favoriteZaker = "الاذكار المفضلة";
}

class ErrorStrings {
  ErrorStrings._();

  static const localDataError = "حدث خطأ في تحميل البيانات";
  static const connectionTimeOut = "انتهي وقت الاتصال ,من فضلك حاول مجددا";
  static const sendTimeOut = "انتهي وقت الاتصال ,من فضلك حاول مجددا";
  static const receiveTimeOut = "انتهي وقت الاتصال ,من فضلك حاول مجددا";
  static const requestTimeOut = "انتهي وقت الاتصال ,من فضلك حاول مجددا";
  static const noInternetConnection =
      "لا يوجد اتصال بالانترنت ,الرجاء التحقق من الاتصال بالانترنت والمحاولة مرة اخري";
  static const unExpectedError = "حدث خطأ غير متوقع, من فضلك حاول مجددا";
  static const oppsError = "حدث خطأ غير متوقع, من فضلك حاول مجددا";
  static const notFound = "حدث خطأ غير متوقع, من فضلك حاول مجددا";
  static const internalError = "حدث خطأ غير متوقع, من فضلك حاول مجددا";
}
