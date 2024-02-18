// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hadith.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Hadith {
  @HiveField(0)
  final int number;
  @HiveField(1)
  final String arab;
  @HiveField(2)
  final String id;
  // @HiveField(3)
  // final String hadithBook;
  @HiveField(3)
  final bool isFavorite;

  Hadith({
    required this.number,
    required this.arab,
    required this.id,
    // required this.hadithBook,
     bool? isFavorite,
  }) : this.isFavorite = isFavorite ?? false;

  Hadith copyWith({int? number, String? arab, String? id, bool? isFavorite}) {
    return Hadith(
        number: number ?? this.number,
        arab: arab ?? this.arab,
        id: id ?? this.id,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  factory Hadith.fromJson(Map<String, dynamic> json) => _$HadithFromJson(json);

  Map<String, dynamic> toJson() => _$HadithToJson(this);
}
