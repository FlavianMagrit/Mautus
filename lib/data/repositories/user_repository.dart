import 'package:firebase_auth/firebase_auth.dart';

import '../dataSources/firestore/user_firestore.dart';

class UserRepository {
  static UserRepository? _instance;
  static UserFirestore _userFirestore = UserFirestore.getInstance();

  static Future<UserRepository> getInstance() async {
    _instance ??= UserRepository._();
    return _instance!;
  }

  UserRepository._();

  Future<User?> signIn({required email, required password}) async {
    UserCredential userCredential = await _userFirestore.signInWithCredentials(
        email: email, password: password);
    return userCredential.user;
  }

  Future<User?> signUp({required email, required password}) async {
    UserCredential userCredential =
        await _userFirestore.signUp(email: email, password: password);
    return userCredential.user;
  }
}
