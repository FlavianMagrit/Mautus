import 'package:firebase_auth/firebase_auth.dart';

import '../dataSources/firestore/user_firestore.dart';

class UserRepository {
  static UserRepository? _instance;
  static final UserFirestore _userFirestore = UserFirestore.getInstance();

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

  Future<void> signOut() async {
    return _userFirestore.signOut();
  }

  // Future<User> insertUser(User user) async {
  //   await _profileHive?.insertUser(user);
  //   return user;
  // }
  //
  // Future<List<User>> getAllFromFirestore() async {
  //   QuerySnapshot<User> users = await _userFirestore!.getAll();
  //   return users.docs.map((e) => e.data()).toList();
  // }
}
