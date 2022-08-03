import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseHelper {
  const FirebaseHelper._();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future signInWithEmailAndPassword(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  static Future signUp(
      String email, String password, BuildContext context) async {
    try {
      final UserCredential credentials = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credentials.user != null) {
        return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(credentials.user!.displayName.toString())));
      } else {
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  static Future signOut() async {
    return await _auth.signOut();
  }
}
