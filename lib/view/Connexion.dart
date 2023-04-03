import 'package:flutter/material.dart';
import 'package:flutter_calendrier/main.dart';
import 'package:flutter_calendrier/view/CalendrierMain.dart';
import 'package:flutter_calendrier/view/inter_registeruser.dart';
import 'package:flutter_calendrier/view/inter_resetpassword.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_calendrier/db/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_calendrier/view/inter_registeruser.dart';

import '../metiers/firebase_auth_services.dart';
import 'MenuCalendrier.dart';

void main(List<String> args) {
  runApp(const ConnexionApp());
}

class ConnexionApp extends StatelessWidget {
  const ConnexionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  ///
  /// Récupère les nombre de calendrier d'un utilisateur donnée
  List<Widget> RecupDonnees(String MailUser) {
    List<String> data = ['Calendrier 1', 'Calendrier 2', 'Calendrier 3'];
    List<Widget> widgets = [];

    for (String item in data) {
      widgets.add(Text(item));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width, // Full Width of Screen
        height: MediaQuery.of(context).size.height, // Full Height of Screen
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200.0,
                height: 200.0,
                child: Image.asset(
                  'assets/images/planif.png',
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "E-Mail", icon: Icon(Icons.person)),
                    controller: emailController,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      hintText: "Mot de passe", icon: Icon(Icons.password)),
                  controller: passwordController,
                ),
              ),
              const SizedBox(height: 16.0),
              FloatingActionButton.extended(
                onPressed: () async {
                  final FirebaseAuthService _auth = FirebaseAuthService();
                  User? user = await _auth.signInWithEmailAndPassword(
                      emailController.text, passwordController.text);
                  if (user != null) {
                    //successfull login
                    print("User successfully logged");
                     Navigator.push(
                      context,
                        MaterialPageRoute(
                          builder: (context) =>
                             MyCustomWidget(listTiles: RecupDonnees("MailUser") ))//   const CalendrierMain(title: 'Calendrier')),
                    );
                  } else {
                    //unsuccessfull login
                    print("User unsuccessfully logged");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Identifiant ou mot de passe incorrect'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.next_plan_rounded),
                label: const Text("Se connecter"),
              ),
              const SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => inter_registeruser()),
                  );
                },
                child: const Text("Vous n'avez pas de compte ? S'inscrire"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => inter_resetpassword()),
                  );
                },
                child: const Text("Mot de passe oublié ? Réinitialiser"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
