import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 1)
class Word {
  @HiveField(0)
  String? text;
  @HiveField(1)
  DateTime? activeDate;

  Word(this.text);
}
