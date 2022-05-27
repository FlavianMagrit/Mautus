import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mautus_flutter/data/dataSources/local/word_hive.dart';
import 'package:mautus_flutter/data/entities/word.dart';
import '../dataSources/firestore/word_firestore.dart';
import '../entities/word.dart';

class WordRepository {
  static WordRepository? _instance;
  static WordHive? _wordHive;
  static Wordfirestore? _wordFirestore;

  static Future<WordRepository> getInstance() async {
    if (_instance == null) {
      _wordHive = await WordHive.getInstance();
      _instance = WordRepository._();
      _wordFirestore = Wordfirestore.getInstance();
    }
    return _instance!;
  }

  WordRepository._();

  Future<Word> insertWord(Word word) async {
    await _wordHive?.insertWord(word);
    return word;
  }

  Future<List<Word>> getAllFromFirestore() async {
    QuerySnapshot<Word> words = await _wordFirestore!.getAll();
    return words.docs.map((e) => e.data()).toList();
  }
}
