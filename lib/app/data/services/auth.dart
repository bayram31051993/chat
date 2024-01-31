import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User getCurrentUser() {
    return _auth.currentUser!;
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _firestore
          .collection("Users")
          .doc(userCredential.user!.uid)
          .set({"email": email, "name": 'Test', "uid": userCredential.user!.uid, 'lastMessage': '', 'date': ''});
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
}
