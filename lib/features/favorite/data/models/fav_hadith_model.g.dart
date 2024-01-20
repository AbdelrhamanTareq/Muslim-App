// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_hadith_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavHadithModelAdapter extends TypeAdapter<FavHadithModel> {
  @override
  final int typeId = 2;

  @override
  FavHadithModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavHadithModel(
      hadithData: fields[0] as String,
      hadithBook: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavHadithModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hadithData)
      ..writeByte(1)
      ..write(obj.hadithBook);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavHadithModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
