import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mautus_flutter/data/entities/word.dart';

class Wordfirestore {
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static Wordfirestore? _instance;

  static late final CollectionReference<Word> _wordRef;

  Wordfirestore._();

  static Wordfirestore getInstance() {
    if (_instance == null) {
      _wordRef = _firebaseFirestore.collection('words').withConverter<Word>(
          fromFirestore: (snapshot, _) => Word.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson());

      _instance = Wordfirestore._();
    }
    return _instance!;
  }

  Future<void> insertWord(Word word) async {
    await _wordRef.add(word);
    return;
  }

  Future<void> insertWordWithId(Word word, String id) async {
    return _wordRef.doc(id).set(word, SetOptions(merge: true));
  }

  Future<QuerySnapshot<Word>> searchWords(String word) async {
    return _wordRef.where('text', isEqualTo: word).get();
  }

  Future<String> getWordId(String word) async {
    String wordId = '';
    QuerySnapshot<Word> test = await _wordRef.get();
    test.docs.forEach((element) {
      if (element.data().text == word) {
        wordId = element.id;
      }
    });
    return wordId;
  }

  Future<void> updateWord(Word word, String id) async {
    return _wordRef.doc(id).update(word.toJson());
  }

  Future<void> deleteWord(String id) async {
    return _wordRef.doc(id).delete();
  }

  Future<QuerySnapshot<Word>> getAll() async {
    return _wordRef.get();
  }
}
