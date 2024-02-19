import 'package:hive/hive.dart';
part 'fav_hadith_model.g.dart';

@HiveType(typeId: 2)
class FavHadithModel {
  @HiveField(0)
  final String hadithData;
  @HiveField(1)
  final String hadithBook;
  @HiveField(2)
  final int hadithNumber;
  @HiveField(3)
  final String key;
  @HiveField(4)
  final String bookPath;

  FavHadithModel(
      {required this.hadithData,
      required this.hadithBook,
      required this.hadithNumber,
      required this.key,
      required this.bookPath});
}
