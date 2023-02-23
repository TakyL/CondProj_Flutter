import 'package:flutter/material.dart';
import 'package:flutter_calendrier/metiers/user_class.dart';
import 'package:flutter_calendrier/metiers/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class inter_registeruser extends StatefulWidget {
  @override
  _inter_registeruser createState() => _inter_registeruser();
}

class _inter_registeruser extends State<inter_registeruser> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    final UserCredential authResult =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("User created: " + email);
    return authResult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registering"),
      ),
      body: Form(
        child: Column(children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextButton(
              child: const Text('Sign Up'),
              onPressed: () {
                createUserWithEmailAndPassword(
                    _emailController.text, _passwordController.text);
              })
        ]),
      ),
    );
  }
}
