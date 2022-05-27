import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 1)
class Word {
  @HiveField(0)
  String? text;

  @HiveField(2)
  DateTime? activeDate;

  Word(this.text, this.activeDate);

  Word.fromJson(Map<String, Object?> json) : this(json['text']! as String, json['activeDate']! as DateTime);

  Map<String, String?> toJson() {
    return {
      'text': text,
      'activeDate': activeDate.toString(),
    };
  }
}
