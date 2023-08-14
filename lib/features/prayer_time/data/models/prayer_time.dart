import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_time.g.dart';

@JsonSerializable()
class PrayerTime {
  final int code;
  final String status;
  final Map<String,List<Data>> data;

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
@HiveType(typeId: 1)
@JsonSerializable()
class Timings {
  @HiveField(0)
  @JsonKey(name: "Fajr")
  final String fajr;
  @HiveField(1)
  @JsonKey(name: "Sunrise")
  final String sunrise;
  @HiveField(2)
  @JsonKey(name: "Dhuhr")
  final String dhuhr;
  @HiveField(3)
  @JsonKey(name: "Asr")
  final String asr;
   @HiveField(4)
  @JsonKey(name: "Sunset")
  final String sunset;
   @HiveField(5)
  @JsonKey(name: "Maghrib")
  final String maghrib;
   @HiveField(6)
  @JsonKey(name: "Isha")
  final String isha;
   @HiveField(7)
  @JsonKey(name: "Imsak")
  final String imsak;
   @HiveField(8)
  @JsonKey(name: "Midnight")
  final String midnight;
   @HiveField(9)
  @JsonKey(name: "Firstthird")
  final String firstthird;
   @HiveField(10)
  @JsonKey(name: "Lastthird")
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
  final num latitude;
  final num longitude;
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
  final Location location;

  Method(
      {required this.id,
      required this.name,
      required this.location});

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}



@JsonSerializable()
class Location {
  final num latitude;
  final num longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Offset {
  @JsonKey(name: "Imsak")
  int imsak;
  @JsonKey(name: "Fajr")
  int fajr;
  @JsonKey(name: "Sunrise")
  int sunrise;
  @JsonKey(name: "Dhuhr")
  int dhuhr;
  @JsonKey(name: "Asr")
  int asr;
  @JsonKey(name: "Maghrib")
  int maghrib;
  @JsonKey(name: "Sunset")
  int sunset;
  @JsonKey(name: "Isha")
  int isha;
  @JsonKey(name: "Midnight")
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
