import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 1)
class Word {
  @HiveField(0)
  String? text;

  @HiveField(2)
  DateTime? activeDate;

  Word(this.text, this.activeDate);

  factory Word.fromJson(Map<String, Object?> json) {
    String? activeDate = json['activeDate'] as String?;
    return Word(json['text']! as String, (activeDate != null) ? DateTime.parse(activeDate) : null);
  }

  Map<String, String?> toJson() {
    return {
      'text': text,
      'activeDate': (activeDate != null) ? activeDate.toString() : null,
    };
  }
}
