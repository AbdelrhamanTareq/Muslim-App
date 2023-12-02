// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_payer_times.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MontlyPrayerTimes _$MontlyPrayerTimesFromJson(Map<String, dynamic> json) =>
    MontlyPrayerTimes(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MontlyPrayerTimesToJson(MontlyPrayerTimes instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
