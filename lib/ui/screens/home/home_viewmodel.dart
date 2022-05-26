import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../../data/repositories/user_repository.dart';

class HomeViewModel with ChangeNotifier {
  String? _word;

  String? get word => _word;

  Future<String?> loadDictionnary() async {
    if (word == null) {
      String dico = await rootBundle.loadString('assets/files/dico.txt');
      List<String> words = dico
          .split("\r\n")
          .where((word) => word.length > 4 && word.length < 8)
          .toList();
      _word = words[Random().nextInt(words.length)];
      notifyListeners();
    }
    return _word;
  }

  Future<void> signOut() async {
    UserRepository userRepository = await UserRepository.getInstance();
    return userRepository.signOut();
  }
}