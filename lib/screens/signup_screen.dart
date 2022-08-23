// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:fcmapp/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameontroller = TextEditingController();
  bool isloading = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      log(googleSignInAuthentication.accessToken.toString());

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      log(" email ===> ${user!.email.toString()}");
      log(" display name ===> ${user.displayName.toString()}");

      if (result != null) {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => HomePage()));

      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  Future<void> signout(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('FCM APP'),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      TextField(
                        controller: _nameontroller,
                        decoration: InputDecoration(
                          labelText: 'name',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      isloading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isloading = true;
                                });
                                // FirebaseHelper.signUp(_emailController.text,
                                //     _passwordController.text, context);
                                signup(context);

                                setState(() {
                                  isloading = false;
                                });
                              },
                              child: const Text("Sign Up")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isloading = true;
                            });
                            // FirebaseHelper.signUp(_emailController.text,
                            //     _passwordController.text, context);
                            signout(context);

                            setState(() {
                              isloading = false;
                            });
                          },
                          child: const Text("Sign out"))
                    ])),
          ),
        ));
  }
}
