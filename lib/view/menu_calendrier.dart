import 'package:flutter/material.dart';

import '../widgets/widget_floating_action_btn.dart';
import 'calendrier_main.dart';
import 'connexion.dart';

///
/// Vue représentant le choix des calendriers
///
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

  ///
  /// Permettra à un utilisateur de créer un nouveau calendrier
  /// Pour l'instant ne fait que rediriger vers le calendrier par defaut
  ///
  void ajoutnouveauCalendrier(BuildContext context)
  {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CalendrierMain(title: 'Calendrier',)));
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
            child: ListView.builder(
              itemCount: listTiles.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // handle the tap event here, for example:
                    print('Tapped on item at index $index');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalendrierMain(title: 'Calendrier',)));
                  },
                  child: listTiles[index],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: MyFloatingActionButton(
          icon: Icons.add,
          key: const Key('add_event_btn'),
          onPressed: () {
            ajoutnouveauCalendrier(context);
          }),
    );
    //);
  }
}
