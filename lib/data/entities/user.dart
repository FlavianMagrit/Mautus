import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class User {
  @HiveField(0)
  String? mail;
  @HiveField(1)
  String? password;
  @HiveField(2)
  String? pseudo;
  @HiveField(3)
  int? score;

  User(this.mail, this.password, this.pseudo, this.score);
}
