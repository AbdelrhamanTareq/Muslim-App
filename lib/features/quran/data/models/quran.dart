// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'quran.g.dart';

@JsonSerializable()
class Quran {
  final int id;
  final String name;
  @JsonKey(name: "name_en")
  final String nameEn;
  @JsonKey(name: "name_translation")
  final String nameTranslation;
  final int words;
  final int letters;
  final String type;
  @JsonKey(name: "type_en")
  final String typeEn;
  final String ar;
  final String en;
  final List<Array> array;

  Quran({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.nameTranslation,
    required this.words,
    required this.letters,
    required this.type,
    required this.typeEn,
    required this.ar,
    required this.en,
    required this.array,
  });

  factory Quran.fromJson(Map<String, dynamic> json) => _$QuranFromJson(json);

  Map<String, dynamic> toJson() => _$QuranToJson(this);
}

@JsonSerializable()
class Array {
  final int id;
  final String ar;
  final String en;
  final String filename;
  final String path;
  final String dir;
  final int size;

  Array({
    required this.id,
    required this.ar,
    required this.en,
    required this.filename,
    required this.path,
    required this.dir,
    required this.size,
  });

  factory Array.fromJson(Map<String, dynamic> json) => _$ArrayFromJson(json);

  Map<String, dynamic> toJson() => _$ArrayToJson(this);
}
