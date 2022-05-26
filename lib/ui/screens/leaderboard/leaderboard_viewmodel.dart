import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/entities/word.dart';
import '../../../data/repositories/word_repository.dart';

class LeaderboardViewModel with ChangeNotifier {
  String? _word;

  String? get word => _word;

  Future<String?> loadDictionnary() async {
    String dico = await rootBundle.loadString('assets/files/dico.txt');
    List<String> wordsList =
        dico.split('\n').where((word) => word.length > 0).toList();

    _word = wordsList[0];
    notifyListeners();
    return _word;
  }
}
