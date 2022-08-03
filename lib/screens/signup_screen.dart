// ignore_for_file: prefer_const_constructors

import 'package:fcmapp/services/firebase_services.dart';
import 'package:flutter/material.dart';

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
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isloading = true;
                            });
                            FirebaseHelper.signUp(_emailController.text,
                                _passwordController.text, context);
                          },
                          child: const Text("Sign Up"))
                    ])),
          ),
        ));
  }
}
