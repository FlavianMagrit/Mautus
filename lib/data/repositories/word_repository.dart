import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mautus_flutter/data/dataSources/local/word_hive.dart';
import 'package:mautus_flutter/data/entities/word.dart';
import '../dataSources/firestore/word_firestore.dart';
import '../entities/word.dart';

class WordRepository {
  static WordRepository? _instance;
  // static WordHive? _wordHive;
  static Wordfirestore? _wordFirestore;

  static Future<WordRepository> getInstance() async {
    if (_instance == null) {
      // _wordHive = await WordHive.getInstance();
      _instance = WordRepository._();
      _wordFirestore = Wordfirestore.getInstance();
    }
    return _instance!;
  }

  WordRepository._();

  Future<Word> insertWord(Word word) async {
    // await _wordHive?.insertWord(word);
    await _wordFirestore?.insertWord(word);
    return word;
  }

  Future<Word> updateWord(Word word, String id) async {
    // await _wordHive?.updateWord(word, id);
    await _wordFirestore?.updateWord(word, id);
    return word;
  }

  Future<QuerySnapshot<Word>?> searchWord(String word) async {
    // return await _wordHive?.searchWords(word);
    return await _wordFirestore?.searchWords(word);
  }
  
  Future<String?> getWordId(String word) async {
    // return await _wordHive?.getWordId(word);
    return await _wordFirestore?.getWordId(word);
  }

  Future<List<Word>> getAll() async {
    // QuerySnapshot<Word> words = await _wordHive!.getAll();
    QuerySnapshot<Word> words = await _wordFirestore!.getAll();
    return words.docs.map((e) => e.data()).toList();
  }
}
