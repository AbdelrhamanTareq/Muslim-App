// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HadithAdapter extends TypeAdapter<Hadith> {
  @override
  final int typeId = 3;

  @override
  Hadith read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hadith(
      number: fields[0] as int,
      arab: fields[1] as String,
      id: fields[2] as String,
      isFavorite: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Hadith obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.arab)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HadithAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hadith _$HadithFromJson(Map<String, dynamic> json) => Hadith(
      number: json['number'] as int,
      arab: json['arab'] as String,
      id: json['id'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$HadithToJson(Hadith instance) => <String, dynamic>{
      'number': instance.number,
      'arab': instance.arab,
      'id': instance.id,
      'isFavorite': instance.isFavorite,
    };
