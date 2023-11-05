// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'monthly_payer_times.g.dart';

@JsonSerializable()
class MontlyPrayerTimes {
  int? code;
  String? status;
  List<Data>? data;

  MontlyPrayerTimes(
      {required this.code, required this.status, required this.data});

  factory MontlyPrayerTimes.fromJson(Map<String, dynamic> json) =>
      _$MontlyPrayerTimesFromJson(json);

  Map<String, dynamic> toJson() => _$MontlyPrayerTimesToJson(this);
}

@JsonSerializable()
class Data {
  Timings? timings;
  Date? date;
  Meta? meta;

  Data({
    required this.date,
    required this.meta,
    required this.timings,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

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
  String? readable;
  String? timestamp;
  Gregorian? gregorian;
  Hijri? hijri;

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
  String? date;
  String? format;
  String? day;
  Weekday1? weekday;
  Month? month;
  String? year;
  Designation? designation;

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
class Weekday1 {
  String? en;

  Weekday1({required this.en});

  factory Weekday1.fromJson(Map<String, dynamic> json) =>
      _$Weekday1FromJson(json);

  Map<String, dynamic> toJson() => _$Weekday1ToJson(this);
}

@JsonSerializable()
class Month {
  int? number;
  String? en;

  Month({required this.number, required this.en});

  factory Month.fromJson(Map<String, dynamic> json) => _$MonthFromJson(json);

  Map<String, dynamic> toJson() => _$MonthToJson(this);
}

@JsonSerializable()
class Designation {
  String? abbreviated;
  String? expanded;

  Designation({required this.abbreviated, required this.expanded});

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);

  Map<String, dynamic> toJson() => _$DesignationToJson(this);
}

@JsonSerializable()
class Hijri {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  List<String>? holidays;

  Hijri(
      {required this.date,
      required this.format,
      required this.day,
      required this.weekday,
      required this.month,
      required this.year,
      required this.designation,
      required this.holidays});

  factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);

  Map<String, dynamic> toJson() => _$HijriToJson(this);
}

@JsonSerializable()
class Weekday {
  String? en;
  String? ar;

  Weekday({required this.en, required this.ar});

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      _$WeekdayFromJson(json);

  Map<String, dynamic> toJson() => _$WeekdayToJson(this);
}

@JsonSerializable()
class Month1 {
  int? number;
  String? en;
  String? ar;

  Month1({required this.number, required this.en, required this.ar});

  factory Month1.fromJson(Map<String, dynamic> json) => _$Month1FromJson(json);

  Map<String, dynamic> toJson() => _$Month1ToJson(this);
}

@JsonSerializable()
class Meta {
  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Offset? offset;

  Meta(
      {required this.latitude,
      required this.longitude,
      required this.timezone,
      required this.method,
      required this.latitudeAdjustmentMethod,
      required this.midnightMode,
      required this.school,
      required this.offset});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Method {
  int? id;
  String? name;
  Params? params;
  Location? location;

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
  int? fajr;
  int? isha;

  Params({required this.fajr, required this.isha});

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}

@JsonSerializable()
class Location {
  double? latitude;
  double? longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Offset {
  int? imsak;
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? sunset;
  int? isha;
  int? midnight;

  Offset(
      {required this.imsak,
      required this.fajr,
      required this.sunrise,
      required this.dhuhr,
      required this.asr,
      required this.maghrib,
      required this.sunset,
      required this.isha,
      required this.midnight});

  factory Offset.fromJson(Map<String, dynamic> json) => _$OffsetFromJson(json);

  Map<String, dynamic> toJson() => _$OffsetToJson(this);
}
