import 'dart:developer';

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
    final UserCredential credentials = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
    log(credentials.user?.uid as String);
    // log(credentials.user?.displayName as String);

    if (credentials.user != null) {
      log(credentials.user?.uid as String);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(credentials.user?.uid as String),
      ));
    } else {
      return false;
    }
    //  catch (e) {

    // }
  }

  static Future signOut() async {
    return await _auth.signOut();
  }
}
