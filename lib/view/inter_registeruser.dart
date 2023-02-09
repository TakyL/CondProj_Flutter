import 'package:flutter/material.dart';
import 'package:flutter_calendrier/classes/user_class.dart';
import 'package:flutter_calendrier/classes/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_calendrier/view/Connexion.dart';

class inter_registeruser extends StatefulWidget {
  @override
  _inter_registeruser createState() => _inter_registeruser();
}

class _inter_registeruser extends State<inter_registeruser> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifyPasswordController = TextEditingController();
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConnexionApp()),
    );
    return authResult;
  }

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter a valid email';
    else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      print("Password must be at least 6 characters");
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? validateMatch(String value) {
    if (_passwordController.text != value) {
      print("Passwords do not match");
      return "Passwords do not match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registering"),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => validateEmail(value!)),
          TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) => validatePassword(value!)),
          TextFormField(
              controller: _verifyPasswordController,
              decoration: const InputDecoration(labelText: 'Verify Password'),
              obscureText: true,
              validator: (value) => validateMatch(value!)),
          TextButton(
            child: const Text('Sign Up'),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  UserCredential authResult =
                      await createUserWithEmailAndPassword(
                          _emailController.text, _passwordController.text);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.toString()),
                    backgroundColor: Colors.red,
                  ));
                }
              }
            },
          )
        ]),
      ),
    );
  }
}
