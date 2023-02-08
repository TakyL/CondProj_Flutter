import 'package:flutter/material.dart';

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
  @override
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
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Prénom", icon: const Icon(Icons.man_2_outlined)),
              ),
            ),
            SizedBox(
              width: 500.0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Nom", icon: const Icon(Icons.man_2_outlined)),
              ),
            ),
            SizedBox(
              width: 500.0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Courriel", icon: const Icon(Icons.mail)),
              ),
            ),
            SizedBox(
              width: 500.0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Pseudonyme",
                    icon: const Icon(Icons.man_4_outlined)),
              ),
            ),
            SizedBox(
              width: 500.0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Mot de passe", icon: const Icon(Icons.password)),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.next_plan_rounded),
              label: const Text("S'inscrire"),
            ),
            InkWell(
              onTap: () {
                // Ce qui se passe lorsque le texte est cliqué
              },
              child: const Text("Vous avez deja un compte ? Se connecter."),
            ),
          ],
        ),
      ),
    );
  }
}
