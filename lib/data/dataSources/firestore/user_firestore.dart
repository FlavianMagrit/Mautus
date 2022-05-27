// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserFirestore {
  // static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static UserFirestore? _instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // static late final CollectionReference<User> _userRef;

  static UserFirestore getInstance() {
    if (_instance == null) {
      // _userRef = _firebaseFirestore.collection('users').withConverter<User>(
      //     fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
      //     toFirestore: (data, _) => data.toJson());

      _instance = UserFirestore._();
    }
    return _instance!;
  }

  UserFirestore._();

  Future<UserCredential> signInWithCredentials(
      {required String email, required String password}) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    return _firebaseAuth.currentUser != null;
  }

  // Future<void> insertUser(User user) async {
  //   await _userRef.add(user);
  //   return;
  // }
  //
  // Future<void> insertWordWithId(Word word, String id) async {
  //   return _wordRef.doc(id).set(word, SetOptions(merge: true));
  // }
  //
  // Future<QuerySnapshot<Word>> searchWords(String word) async {
  //   return _wordRef.where('x', isEqualTo: 1).get();
  // }
  //
  // Future<void> deleteWord(String id) async {
  //   return _wordRef.doc(id).delete();
  // }
  //
  // Future<void> updateWord(Word word, String id) async {
  //   return _wordRef.doc(id).update(word.toJson());
  // }
  //
  // Future<QuerySnapshot<Word>> getAll() async {
  //   return _wordRef.get();
  // }
}
