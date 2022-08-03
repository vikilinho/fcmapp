import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'name',
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Sign Up"))
                    ])),
          ),
        ));
  }
}
