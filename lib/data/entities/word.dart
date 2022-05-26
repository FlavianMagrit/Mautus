import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 1)
class Word {
  @HiveField(0)
  String? x;


  // @HiveField(2)
  // DateTime? activeDate;

  Word(this.x);
}
