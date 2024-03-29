// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimingsAdapter extends TypeAdapter<Timings> {
  @override
  final int typeId = 1;

  @override
  Timings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timings(
      fajr: fields[0] as String,
      sunrise: fields[1] as String,
      dhuhr: fields[2] as String,
      asr: fields[3] as String,
      sunset: fields[4] as String,
      maghrib: fields[5] as String,
      isha: fields[6] as String,
      imsak: fields[7] as String,
      midnight: fields[8] as String,
      firstthird: fields[9] as String,
      lastthird: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Timings obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.fajr)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.dhuhr)
      ..writeByte(3)
      ..write(obj.asr)
      ..writeByte(4)
      ..write(obj.sunset)
      ..writeByte(5)
      ..write(obj.maghrib)
      ..writeByte(6)
      ..write(obj.isha)
      ..writeByte(7)
      ..write(obj.imsak)
      ..writeByte(8)
      ..write(obj.midnight)
      ..writeByte(9)
      ..write(obj.firstthird)
      ..writeByte(10)
      ..write(obj.lastthird);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTime _$PrayerTimeFromJson(Map<String, dynamic> json) => PrayerTime(
      code: json['code'] as int,
      status: json['status'] as String,
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => Data.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$PrayerTimeToJson(PrayerTime instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      timings: Timings.fromJson(json['timings'] as Map<String, dynamic>),
      date: Date.fromJson(json['date'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'timings': instance.timings,
      'date': instance.date,
      'meta': instance.meta,
    };

Timings _$TimingsFromJson(Map<String, dynamic> json) => Timings(
      fajr: json['Fajr'] as String,
      sunrise: json['Sunrise'] as String,
      dhuhr: json['Dhuhr'] as String,
      asr: json['Asr'] as String,
      sunset: json['Sunset'] as String,
      maghrib: json['Maghrib'] as String,
      isha: json['Isha'] as String,
      imsak: json['Imsak'] as String,
      midnight: json['Midnight'] as String,
      firstthird: json['Firstthird'] as String,
      lastthird: json['Lastthird'] as String,
    );

Map<String, dynamic> _$TimingsToJson(Timings instance) => <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Sunset': instance.sunset,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
      'Imsak': instance.imsak,
      'Midnight': instance.midnight,
      'Firstthird': instance.firstthird,
      'Lastthird': instance.lastthird,
    };

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      readable: json['readable'] as String,
      timestamp: json['timestamp'] as String,
      gregorian: Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
      hijri: Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'readable': instance.readable,
      'timestamp': instance.timestamp,
      'gregorian': instance.gregorian,
      'hijri': instance.hijri,
    };

Gregorian _$GregorianFromJson(Map<String, dynamic> json) => Gregorian(
      date: json['date'] as String,
      format: json['format'] as String,
      day: json['day'] as String,
      weekday: WeekdayData.fromJson(json['weekday'] as Map<String, dynamic>),
      month: Month.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] as String,
      designation:
          Designation.fromJson(json['designation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GregorianToJson(Gregorian instance) => <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
      'designation': instance.designation,
    };

WeekdayData _$WeekdayDataFromJson(Map<String, dynamic> json) => WeekdayData(
      en: json['en'] as String,
    );

Map<String, dynamic> _$WeekdayDataToJson(WeekdayData instance) =>
    <String, dynamic>{
      'en': instance.en,
    };

Month _$MonthFromJson(Map<String, dynamic> json) => Month(
      number: json['number'] as int,
      en: json['en'] as String,
    );

Map<String, dynamic> _$MonthToJson(Month instance) => <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
    };

Designation _$DesignationFromJson(Map<String, dynamic> json) => Designation(
      abbreviated: json['abbreviated'] as String,
      expanded: json['expanded'] as String,
    );

Map<String, dynamic> _$DesignationToJson(Designation instance) =>
    <String, dynamic>{
      'abbreviated': instance.abbreviated,
      'expanded': instance.expanded,
    };

Hijri _$HijriFromJson(Map<String, dynamic> json) => Hijri(
      date: json['date'] as String,
      format: json['format'] as String,
      day: json['day'] as String,
      weekday: WeekdayData.fromJson(json['weekday'] as Map<String, dynamic>),
      month: Month.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] as String,
      designation:
          Designation.fromJson(json['designation'] as Map<String, dynamic>),
      holidays:
          (json['holidays'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HijriToJson(Hijri instance) => <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
      'designation': instance.designation,
      'holidays': instance.holidays,
    };

WeekdayData1 _$WeekdayData1FromJson(Map<String, dynamic> json) => WeekdayData1(
      en: json['en'] as String,
      ar: json['ar'] as String,
    );

Map<String, dynamic> _$WeekdayData1ToJson(WeekdayData1 instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };

MonthData _$MonthDataFromJson(Map<String, dynamic> json) => MonthData(
      number: json['number'] as int,
      en: json['en'] as String,
      ar: json['ar'] as String,
    );

Map<String, dynamic> _$MonthDataToJson(MonthData instance) => <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
      'ar': instance.ar,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      latitude: json['latitude'] as num,
      longitude: json['longitude'] as num,
      timezone: json['timezone'] as String,
      method: Method.fromJson(json['method'] as Map<String, dynamic>),
      latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String,
      midnightMode: json['midnightMode'] as String,
      school: json['school'] as String,
      offset: Offset.fromJson(json['offset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'method': instance.method,
      'latitudeAdjustmentMethod': instance.latitudeAdjustmentMethod,
      'midnightMode': instance.midnightMode,
      'school': instance.school,
      'offset': instance.offset,
    };

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
      id: json['id'] as int,
      name: json['name'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: json['latitude'] as num,
      longitude: json['longitude'] as num,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Offset _$OffsetFromJson(Map<String, dynamic> json) => Offset(
      imsak: json['Imsak'] as int,
      fajr: json['Fajr'] as int,
      sunrise: json['Sunrise'] as int,
      dhuhr: json['Dhuhr'] as int,
      asr: json['Asr'] as int,
      maghrib: json['Maghrib'] as int,
      sunset: json['Sunset'] as int,
      isha: json['Isha'] as int,
      midnight: json['Midnight'] as int,
    );

Map<String, dynamic> _$OffsetToJson(Offset instance) => <String, dynamic>{
      'Imsak': instance.imsak,
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Maghrib': instance.maghrib,
      'Sunset': instance.sunset,
      'Isha': instance.isha,
      'Midnight': instance.midnight,
    };
