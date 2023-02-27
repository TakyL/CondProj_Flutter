
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendrier/metiers/evenements_class.dart';

import '../outils/StringConvert.dart';

class MyListTile extends StatelessWidget {
  final Evenement event;

  const MyListTile({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                StringConvert.formatDuration(
                  event.date_debut,
                  event.date_fin,
                  event.heure_debut,
                  event.heure_fin,
                ),
              ),
            ),
            const Icon(Icons.access_time_rounded),
            Center(
              child: Text(
                StringConvert.calculateDuration(
                  event.date_debut,
                  event.date_fin,
                  event.heure_debut,
                  event.heure_fin,
                ),
              ),
            ),
          ],
        ),
      ),
      subtitle: Center(child: Text(event.nom)),
    );
  }
}