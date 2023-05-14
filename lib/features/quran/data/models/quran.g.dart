// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quran _$QuranFromJson(Map<String, dynamic> json) => Quran(
      id: json['id'] as int,
      name: json['name'] as String,
      nameEn: json['name_en'] as String,
      nameTranslation: json['name_translation'] as String,
      words: json['words'] as int,
      letters: json['letters'] as int,
      type: json['type'] as String,
      typeEn: json['type_en'] as String,
      ar: json['ar'] as String,
      en: json['en'] as String,
      array: (json['array'] as List<dynamic>)
          .map((e) => Array.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuranToJson(Quran instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_en': instance.nameEn,
      'name_translation': instance.nameTranslation,
      'words': instance.words,
      'letters': instance.letters,
      'type': instance.type,
      'type_en': instance.typeEn,
      'ar': instance.ar,
      'en': instance.en,
      'array': instance.array,
    };

Array _$ArrayFromJson(Map<String, dynamic> json) => Array(
      id: json['id'] as int,
      ar: json['ar'] as String,
      en: json['en'] as String,
      filename: json['filename'] as String,
      path: json['path'] as String,
      dir: json['dir'] as String,
      size: json['size'] as int,
    );

Map<String, dynamic> _$ArrayToJson(Array instance) => <String, dynamic>{
      'id': instance.id,
      'ar': instance.ar,
      'en': instance.en,
      'filename': instance.filename,
      'path': instance.path,
      'dir': instance.dir,
      'size': instance.size,
    };
