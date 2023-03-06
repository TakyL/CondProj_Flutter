import 'package:flutter/material.dart';

///
/// Vue représentant le choix des calendriers
/// Etat de sample pour le moment
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
  void onBack()
  {
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
        onPressed: onBack,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
