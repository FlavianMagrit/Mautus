import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class UserHive {
  static UserHive? _instance;
  static Box<User>? _box;

  static Future<UserHive> getInstance() async {
    if (_instance == null) {
      _box = await Hive.openBox('Word');
      _instance = UserHive._();
    }
    return _instance!;
  }

  UserHive._();

  Future<void> insertUser(User user) async {
    await _box?.add(user);
    // await _box?.close();
    return;
  }
}
