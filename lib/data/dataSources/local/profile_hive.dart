import 'package:hive/hive.dart';
import 'package:mautus_flutter/data/entities/profile.dart';

class ProfileHive {
  static ProfileHive? _instance;
  static Box<Profile>? _box;

  static Future<ProfileHive> getInstance() async {
    if (_instance == null) {
      _box = await Hive.openBox('Profile');
      _instance = ProfileHive._();
    }
    return _instance!;
  }

  ProfileHive._();

  Future<void> insertProfile(Profile profile) async {
    await _box?.add(profile);
    // await _box?.close();
    return;
  }
}