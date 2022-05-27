import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mautus_flutter/data/repositories/word_repository.dart';
import '../../../data/entities/word.dart';
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
      insertWord(_word!);
      print(_word);
      notifyListeners();
    }
    return _word;
  }

  Future<Word> insertWord(String word) async {
    DateTime currentDate = DateTime(2022, 5, 27);
    Word newWord = Word(word, currentDate);
    WordRepository wordRepository = await WordRepository.getInstance();
    return wordRepository.insertWord(newWord);
  }

  Future<void> signOut() async {
    UserRepository userRepository = await UserRepository.getInstance();
    return userRepository.signOut();
  }
}
