import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  const FirebaseHelper._();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future signInWithEmailAndPassword(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  static Future signUp(String email, String password) async {
    final UserCredential credentials = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future signOut() async {
    return await _auth.signOut();
  }
}
