import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mautus_flutter/data/repositories/word_repository.dart';
import '../../../data/entities/word.dart';
import '../../../data/repositories/user_repository.dart';

class HomeViewModel with ChangeNotifier {
  Word? _word;
  String _response = '';
  String _gameState = 'game';

  Word? get word => _word;
  String get response => _response;
  String get gameState => _gameState;

  Future<List<String>> loadLocalDictionary() async {
    String dico = await rootBundle.loadString('assets/files/dico.txt');
    List<String> words = dico
      .split("\r\n")
      .where((word) => word.length > 4 && word.length < 8)
      .toList();
    // for (int i=0 ; i<dico.length ; i++) {
    //   insertWord(words[i]);
    // }
    return words;
  }

  Future<Word> insertWord(String word) async {
    WordRepository wordRepository = await WordRepository.getInstance();
    Word newWord = Word(word, null);
    return wordRepository.insertWord(newWord);
  }

  Future<Word> loadFirestoreDictionary() async {
    WordRepository wordRepository = await WordRepository.getInstance();
    List<Word> dictionary = await wordRepository.getAll();
    dictionary.where((word) => word.text!.length > 4 && word.text!.length < 8);
    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(now.year, now.month, now.day);
    for (int i=0 ; i<dictionary.length ; i++) {
      if (dictionary[i].activeDate == currentDate) {
        _word = dictionary[i];
        break;
      }
    }
    while (_word == null || _word!.activeDate != null) {
      _word = dictionary[Random().nextInt(dictionary.length)];
    }
    print(_word!);
    updateWord(_word!);
    notifyListeners();
    return _word!;
  }

  Future<Word> updateWord(Word word) async {
    WordRepository wordRepository = await WordRepository.getInstance();
    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(now.year, now.month, now.day);
    Word wordWithDate = Word(word.text, currentDate);
    String? wordId = await searchWord(word);
    notifyListeners();
    return wordRepository.updateWord(wordWithDate, wordId!);
  }

  Future<String?> searchWord(Word word) async {
    WordRepository wordRepository = await WordRepository.getInstance();
    String? wordId = await wordRepository.getWordId(word.text!);
    return wordId;
  }

  Future<void> signOut() async {
    UserRepository userRepository = await UserRepository.getInstance();
    return userRepository.signOut();
  }

  String resetString() {
    return _response = '';
  }

  String incrementString(String letter) {
    if (_response == '') {
      _response = letter;
    } else {
      _response = _response + letter;
    }
    return _response;
  }

  String setState(String state) {
    _gameState = state;
    notifyListeners();
    return _gameState;
  }
}
