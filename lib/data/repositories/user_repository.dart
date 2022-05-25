import '../dataSources/local/user_hive.dart';
import '../entities/user.dart';

class UserRepository {
  static UserRepository? _instance;
  static UserFirestore? _userFirestore;

  static Future<UserRepository> getInstance() async {
    _instance ??= UserRepository._();
    return _instance!;
  }

  UserRepository._();

  Future<User?> signIn({required email, required password}) async {
    UserCredential userCredential = await _userFirestore.signInWithCredentials(email: email, password: password);
    return userCredential.user;
  }
}