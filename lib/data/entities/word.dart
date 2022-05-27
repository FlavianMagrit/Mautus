import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 1)
class Word {
  @HiveField(0)
  String? x;

  // @HiveField(2)
  // DateTime? activeDate;

  Word(this.x);

  Word.fromJson(Map<String, Object?> json) : this(json['x']! as String);

  Map<String, String?> toJson() {
    return {
      'x': x,
    };
  }
}
