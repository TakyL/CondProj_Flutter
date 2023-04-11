import 'package:flutter/material.dart';

import 'connexion.dart';

///
/// Vue représentant le choix des calendriers
/// Etat de sample pour le moment
/// Il lui la liste des evenements sous forme de list de widget
///
class MyCustomWidget extends StatelessWidget {

  final List<Widget> listTiles;

  const MyCustomWidget({
    Key? key,
    required this.listTiles,
  }) : super(key: key);

  ///
  /// Fonction qui retourne vers un menu précédent
  ///
  void onBack(BuildContext context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
          const RootPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: listTiles,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onBack(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
