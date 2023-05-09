import 'package:flutter/material.dart';
import 'package:flutter_calendrier/view/connexion.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_calendrier/metiers/firebase_auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_calendrier/db/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting().then((_) => runApp(const MyApp()));
  runApp(const MyApp());

  final FirebaseAuthService _auth = FirebaseAuthService();
  User? user =
  await _auth.signInWithEmailAndPassword("hugodip@orange.fr", "hugodipa");
  if (user != null) {
    //successfull login
    print("User successfully logged");
  } else {
    //unsuccessfull login
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Calendrier',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        /*   localizationsDelegates: [
    GlobalMaterialLocalizations.delegates
  //  GlobalWidgetsLocalizations.delegate,
  //  GlobalCupertinoLocalizations.delegate,
  ],supportedLocales: [
    const Locale('en'),
    const Locale('fr')
  ]
  ,*/
        home: const RootPage());  }
}

