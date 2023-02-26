import 'package:flutter/material.dart';
///
///
///
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
        title: const Text('Connexion'),
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
            const SizedBox(
              width: 500.0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Identifiant",
                    icon: Icon(Icons.account_circle_outlined),
              )),
            ),
            const SizedBox(
              width: 500.0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Mot de passe", icon: Icon(Icons.password)
                    ),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.next_plan_rounded),
              label: const Text("Se connecter"),
            ),
            InkWell(
              onTap: () {
                // Ce qui se passe lorsque le texte est cliqué
              },
              child: const Text("Inscription"),
            ),
          ],
        ),
      ),
    );
  }
}
