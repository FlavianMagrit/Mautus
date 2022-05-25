import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/repositories/user_repository.dart';

class SignInAndSignUpViewModel with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> signIn({required email, required password}) async {
    UserRepository userRepository = await UserRepository.getInstance();
    try {
      _user = await userRepository.signIn(email: email, password: password);
    } on Exception catch (_) {
      _user ??= await userRepository.signUp(email: email, password: password);
    }
    notifyListeners();
    return;
  }
}
