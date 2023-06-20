// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Azkar _$AzkarFromJson(Map<String, dynamic> json) => Azkar(
      id: json['id'] as int,
      category: json['category'] as String,
      audio: json['audio'] as String,
      filename: json['filename'] as String,
      array: (json['array'] as List<dynamic>)
          .map((e) => Array.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AzkarToJson(Azkar instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'audio': instance.audio,
      'filename': instance.filename,
      'array': instance.array,
    };

Array _$ArrayFromJson(Map<String, dynamic> json) => Array(
      id: json['id'] as int,
      text: json['text'] as String,
      count: json['count'] as int,
      audio: json['audio'] as String,
      filename: json['filename'] as String,
    );

Map<String, dynamic> _$ArrayToJson(Array instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'count': instance.count,
      'audio': instance.audio,
      'filename': instance.filename,
    };
