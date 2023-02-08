import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendrier/classes/firebase_auth_services.dart';
import 'Inscription.dart';

void main(List<String> args) {
  runApp(const ConnexionApp());
}

class ConnexionApp extends StatelessWidget {
  const ConnexionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const ConnexionPage(),
    );
  }
}

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  String errorMessage = '';
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONNEXION'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width, // Full Width of Screen
        height: 800.0, // Desired Height

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200.0,
              height: 200.0,
              child: Image.asset(
                'lib/assets/logo.png',
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              width: 500.0,
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Identifiant", icon: Icon(Icons.man_2_outlined)),
              ),
            ),
            SizedBox(
              width: 500.0,
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Mot de passe", icon: Icon(Icons.lock)),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                final user = await FirebaseAuthService()
                    .signInWithEmailAndPassword(
                        emailController.text, passwordController.text);
                if (user == null) {
                  print("Erreur");
                  setState(() {
                    errorMessage = 'Email ou mot de passe incorrect';
                  });
                } else {
                  print("Succes");
                }
              },
              icon: const Icon(Icons.next_plan_rounded),
              label: const Text("Se connecter"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InscriptionPage()),
                );
              },
              child: const Text("Inscription"),
            ),
            InkWell(
              child: Text(errorMessage),
            ),
          ],
        ),
      ),
    );
  }
}
