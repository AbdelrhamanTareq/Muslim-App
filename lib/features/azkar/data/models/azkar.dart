import 'package:json_annotation/json_annotation.dart';

part 'azkar.g.dart';

@JsonSerializable()
class Azkar {
  final int id;
  final String category;
  final String audio;
  final String filename;
  final List<Array> array;

  Azkar({
    required this.id,
    required this.category,
    required this.audio,
    required this.filename,
    required this.array,
  });

  factory Azkar.fromJson(Map<String, dynamic> json) => _$AzkarFromJson(json);

  Map<String, dynamic> toJson() => _$AzkarToJson(this);
}

@JsonSerializable()
class Array {
  final int id;
  final String text;
  final int count;
  final String audio;
  final String filename;

  Array({
    required this.id,
    required this.text,
    required this.count,
    required this.audio,
    required this.filename,
  });
  factory Array.fromJson(Map<String, dynamic> json) => _$ArrayFromJson(json);

  Map<String, dynamic> toJson() => _$ArrayToJson(this);
}
