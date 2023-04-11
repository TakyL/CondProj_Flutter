import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calendrier/classes/firebase_auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_calendrier/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  group('Registration tests', () {
    test('Register should succeed with valid email and password', () async {
      final String validEmail = 'hugodip@orange.fr';
      final String validPassword = 'hugodipa';
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      // Attempt to create the user account
      UserCredential? result =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: validEmail, password: validPassword);

      // Ensure the user was created successfully
      expect(result, isNotNull);
      expect(result.user, isNotNull);

      // Delete the test user account from Firebase
      await result.user!.delete();
    });

    test('Register should fail with invalid email or password', () async {
      final String invalidEmail = 'azerty@google.com';
      final String invalidPassword = 'azerty';
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

      // Attempt to create the user account
      UserCredential? result =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: invalidEmail, password: invalidPassword);

      // Ensure the user was not created
      expect(result, isNull);
    });
  });
}
