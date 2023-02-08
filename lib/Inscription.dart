import 'package:flutter/material.dart';
import 'package:flutter_calendrier/view/inter_registeruser.dart';
import 'Connexion.dart';
import 'classes/firebase_auth_services.dart';
import 'classes/user_class.dart';

void main(List<String> args) {
  runApp(const InscriptionApp());
}

class InscriptionApp extends StatelessWidget {
  const InscriptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const InscriptionPage(),
    );
  }
}

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPage();
}

class _InscriptionPage extends State<InscriptionPage> {
  @override
  final passwordController = TextEditingController();
  final passwordverifController = TextEditingController();
  final emailController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INSCRIPTION'),
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
                decoration: const InputDecoration(
                    hintText: "Prénom", icon: Icon(Icons.man_2_outlined)),
              ),
            ),
            SizedBox(
              width: 500.0,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Nom", icon: Icon(Icons.man_2_outlined)),
              ),
            ),
            SizedBox(
              width: 500.0,
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Courriel", icon: Icon(Icons.mail)),
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
            SizedBox(
              width: 500.0,
              child: TextFormField(
                controller: passwordverifController,
                decoration: const InputDecoration(
                    hintText: "Mot de passe vérifiation",
                    icon: Icon(Icons.lock)),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                final FirebaseAuthService _auth = FirebaseAuthService();

                if (passwordController.text == passwordverifController.text) {
                  User? user = (await _auth.signInWithEmailAndPassword(
                      emailController.text, passwordController.text)) as User?;
                  if (user != null) {
                    //successfull login
                  } else {
                    //unsuccessfull login
                  }
                }
              },
              icon: const Icon(Icons.next_plan_rounded),
              label: const Text("S'inscrire"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConnexionPage()),
                );
              },
              child: const Text("Vous avez deja un compte ? Se connecter."),
            ),
          ],
        ),
      ),
    );
  }
}
