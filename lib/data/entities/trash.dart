import 'package:hive/hive.dart';
import 'package:mautus_flutter/data/entities/word.dart';

part 'trash.g.dart';

@HiveType(typeId: 1)
class Trash{
  @HiveField(0)
  List<Word>? usedWords;

  Trash(this.usedWords);
}
