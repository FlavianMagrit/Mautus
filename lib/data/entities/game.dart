import 'package:hive/hive.dart';
import 'package:mautus_flutter/data/entities/user.dart';
import 'package:mautus_flutter/data/entities/word.dart';

part 'game.g.dart';

@HiveType(typeId: 2)
class Game {
  @HiveField(0)
  DateTime? beginDate;
  @HiveField(1)
  DateTime? endDate;
  @HiveField(2)
  int? score;
  @HiveField(3)
  User? player;
  @HiveField(4)
  Word? word;
  @HiveField(5)
  List<Word>? tries;
  @HiveField(6)
  int? limitTries;

  Game(this.beginDate, this.endDate,  this.score,  this.player,  this.word,  this.tries,  this.limitTries);
}
