// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'hadith.g.dart';


@JsonSerializable()
class Hadith {
  final int number;
  final String arab;
  final String id;

  Hadith({
    required this.number,
    required this.arab,
    required this.id,
  });


  factory Hadith.fromJson(Map<String, dynamic> json) => _$HadithFromJson(json);

  Map<String, dynamic> toJson() => _$HadithToJson(this);
}
