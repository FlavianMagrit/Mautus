import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mautus_flutter/data/repositories/word_repository.dart';
import '../../../data/entities/word.dart';

class HomeViewModel with ChangeNotifier {
  Word? _word;

  Word? get word => _word;

  Future<void> insertWord(Word word) async {
    WordRepository repository = await WordRepository.getInstance();
    repository.insertWord(word);
    _word = word;
    notifyListeners();
  }

  Future<String> loadDictionnary() async {
    String dico = await rootBundle.loadString('assets/files/dico.txt');
    List<String> words = dico.split("\r\n").where((element) => element.length > 4).toList();
    return words[1];
  }
}