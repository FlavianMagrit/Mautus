import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 3)
class Profile {
  @HiveField(0)
  String? email;
  @HiveField(1)
  String? pseudo;
  @HiveField(2)
  int? score;

  Profile(this.email, this.pseudo, this.score);
}
