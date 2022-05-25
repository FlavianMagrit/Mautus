import '../dataSources/local/profile_hive.dart';
import '../entities/profile.dart';

class ProfileRepository {
  static ProfileRepository? _instance;
  static ProfileHive? _profileHive;

  static Future<ProfileRepository> getInstance() async {
    if (_instance == null) {
      _profileHive = await ProfileHive.getInstance();
      _instance = ProfileRepository._();
    }
    return _instance!;
  }

  ProfileRepository._();

  Future<Profile> insertProfile(Profile profile) async {
    await _profileHive?.insertProfile(profile);
    return profile;
  }
}