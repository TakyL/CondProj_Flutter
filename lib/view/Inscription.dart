import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const InscriptionApp());
}

class InscriptionApp extends StatelessWidget {
  const InscriptionApp({super.key});

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
        title: const Text('Inscription'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width, // Full Width of Screen
        height: 800.0, // Desired Height

        child: Flex(
          direction: Axis.vertical,
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
            const SizedBox(
              width: 500.0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Courriel", icon: const Icon(Icons.mail)),
              ),
            ),
            const SizedBox(
              width: 500.0,
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Mot de passe", icon: Icon(Icons.password)),
              ),
            ),
            const SizedBox(
              width: 500.0,
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Vérifier Mot de passe",
                    icon: Icon(Icons.password)),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.next_plan_rounded),
              label: const Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}