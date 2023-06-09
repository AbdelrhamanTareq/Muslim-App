import 'package:json_annotation/json_annotation.dart';

part 'prayer_time.g.dart';

@JsonSerializable()
class PrayerTime {
  final int code;
  final String status;
  final List<Data> data;

  PrayerTime({required this.code, required this.status, required this.data});

  factory PrayerTime.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimeFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimeToJson(this);
}

@JsonSerializable()
class Data {
  final Timings timings;
  final Date date;
  final Meta meta;

  Data({required this.timings, required this.date, required this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstthird;
  final String lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) =>
      _$TimingsFromJson(json);

  Map<String, dynamic> toJson() => _$TimingsToJson(this);
}

@JsonSerializable()
class Date {
  final String readable;
  final String timestamp;
  final Gregorian gregorian;
  final Hijri hijri;

  Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);
}

@JsonSerializable()
class Gregorian {
  final String date;
  final String format;
  final String day;
  final WeekdayData weekday;
  final Month month;
  final String year;
  final Designation designation;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });
  factory Gregorian.fromJson(Map<String, dynamic> json) =>
      _$GregorianFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianToJson(this);
}

@JsonSerializable()
class WeekdayData {
  String en;

  WeekdayData({required this.en});

  factory WeekdayData.fromJson(Map<String, dynamic> json) =>
      _$WeekdayDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeekdayDataToJson(this);
}

@JsonSerializable()
class Month {
  final int number;
  final String en;

  Month({required this.number, required this.en});

  factory Month.fromJson(Map<String, dynamic> json) => _$MonthFromJson(json);

  Map<String, dynamic> toJson() => _$MonthToJson(this);
}

@JsonSerializable()
class Designation {
  final String abbreviated;
  final String expanded;

  Designation({required this.abbreviated, required this.expanded});

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);

  Map<String, dynamic> toJson() => _$DesignationToJson(this);
}

@JsonSerializable()
class Hijri {
  final String date;
  final String format;
  final String day;
  final WeekdayData weekday;
  final Month month;
  final String year;
  final Designation designation;
  final List<String> holidays;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);

  Map<String, dynamic> toJson() => _$HijriToJson(this);
}

@JsonSerializable()
class WeekdayData1 {
  final String en;
  final String ar;

  WeekdayData1({required this.en, required this.ar});

  factory WeekdayData1.fromJson(Map<String, dynamic> json) =>
      _$WeekdayData1FromJson(json);

  Map<String, dynamic> toJson() => _$WeekdayData1ToJson(this);
}

@JsonSerializable()
class MonthData {
  final int number;
  final String en;
  final String ar;

  MonthData({required this.number, required this.en, required this.ar});

  factory MonthData.fromJson(Map<String, dynamic> json) =>
      _$MonthDataFromJson(json);

  Map<String, dynamic> toJson() => _$MonthDataToJson(this);
}

@JsonSerializable()
class Meta {
  final double latitude;
  final double longitude;
  final String timezone;
  final Method method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Offset offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Method {
  final int id;
  final String name;
  final Params params;
  final Location location;

  Method(
      {required this.id,
      required this.name,
      required this.params,
      required this.location});

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}

@JsonSerializable()
class Params {
  final int fajr;
  final int isha;

  Params({required this.fajr, required this.isha});

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}

@JsonSerializable()
class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Offset {
  int imsak;
  int fajr;
  int sunrise;
  int dhuhr;
  int asr;
  int maghrib;
  int sunset;
  int isha;
  int midnight;

  Offset({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.sunset,
    required this.isha,
    required this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => _$OffsetFromJson(json);

  Map<String, dynamic> toJson() => _$OffsetToJson(this);
}