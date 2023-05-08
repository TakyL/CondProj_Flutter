import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../db/database_evenement.dart';
import '../db/database_prioriete.dart';
import '../metiers/evenements_class.dart';
import '../metiers/priorité_class.dart';
import '../widgets/widget_container.dart';
import '../widgets/widget_floating_action_btn.dart';
import 'calendrier_evenements.dart';
import 'ajouter_event.dart';

///Vue principale de l'app
///Affichage d'un calendrier
///
class CalendrierMain extends StatefulWidget {
  const CalendrierMain({Key? key, required this.title}) : super(key: key);

  final String title; //Nom du CalendrierMain
  //On pourra avoir la liste des evenements => selectedevents
  @override
  State<CalendrierMain> createState() => _CalendrierMainState();
}

class _CalendrierMainState extends State<CalendrierMain> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  void fas(DatabaseReference ref) async {
    DbEvent e = DbEvent();
    e.getDonnees();
    // e.getDonneesById(3);
  }

  late Map<DateTime, List<Evenement>> selectedevents;

  ///Redirige vers le menu d'ajout d'un événement
  void menuajoutevent() //Push vers le menu d'ajout d'evenement
  {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Inter_Event(
                time: focusedday, callback: addEventListCalendar)));
  }

  ///Ajout un evenement à la db
  void addEventListCalendar(DateTime d, Evenement e) {
    //La liste des events est géré localement, mais fait tout de même le post pour l'instant
    if (selectedevents[d] != null) {
      selectedevents[d]?.add(Evenement.json(
        nom: e.nom,
        auteur: e.auteur,
        date_debut: e.date_debut,
        date_fin: e.date_fin,
        description: e.description,
        heure_debut: e.heure_debut,
        heure_fin: e.heure_fin,
        prioName: e.prio.nom,
      ));
      DbEvent liantdemo = DbEvent();
      liantdemo.postDonneees(e);
    } else {
      selectedevents[d] = [
        Evenement.json(
          nom: e.nom,
          auteur: e.auteur,
          date_debut: e.date_debut,
          date_fin: e.date_fin,
          description: e.description,
          heure_debut: e.heure_debut,
          heure_fin: e.heure_fin,
          prioName: e.prio.nom,
        )
      ];
      DbEvent liantdemo = DbEvent();

      liantdemo.postDonneees(e);
      debugPrint("AJOUT");
    }
  }

  //Return l'evenement du jour selectionné
  List<Evenement> _getEventsFromDay(DateTime d) {
    return selectedevents[d] ?? [];
  }

  List<prioriete> listp = <prioriete>[];

  ///Récupère la couleur en fonction de la prioriete de l'évenement en réalisant un appel à la db
  Future<MaterialColor> getMaterialColor(String prioName) async {
    if (prioName.isNotEmpty) {
      db_prio dab = db_prio();
      prioriete? pr = await dab.getDonneesByAttributsv2(prioName);
      if (pr != null) {
        debugPrint("Col${pr.couleur.runtimeType}");
        MaterialColor a = await pr.couleur;
        return a;
      }
    }
    return Colors.blue;
  }

  Future<MaterialColor> CastToMaterialColor(Evenement evenement) async {
    if (evenement.prioName.isNotEmpty) {
      MaterialColor a = await getMaterialColor(evenement.prioName);
      return a;
    } else {
      throw ("Problème au niveau de la prioriété");
    }
  }

  DateTime focusedday = DateTime.now();
  DateTime selectedday = DateTime.now();
  CalendarFormat format = CalendarFormat.month;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    selectedevents = {};
    super.initState();

    ///print(getFrenchDay("17/02/2022"));
  }

  ///Construit l'interface du calendrier
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TableCalendar(  //Widget calendrier
              locale: 'fr_FR',
              focusedDay: focusedday,
              firstDay: DateTime(2020),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                setState(() {
                  selectedday = selectedDay;
                  focusedday = focusedDay;
                });
              },
              availableCalendarFormats: const {
                CalendarFormat.month: 'Mois',
                CalendarFormat.twoWeeks: '2 semaines',
                CalendarFormat.week: 'Semaine',
              },
              weekNumbersVisible: true,
              startingDayOfWeek: StartingDayOfWeek.monday,
              // const [DateTime.saturday, DateTime.sunday]
              calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.rectangle,
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    shape: BoxShape.rectangle,
                  )),
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedday, date);
              },
            ),
            ..._getEventsFromDay(selectedday).map((Evenement e) => MyContainer(//Affiche des evenements
                // color:  test(e) as MaterialColor,//await test(e) as MaterialColor,//Colors.blueGrey,//e.prio.couleur,
                colorFuture: CastToMaterialColor(e),
                child: MyListTile(
                  event: e,
                  subtitle: '',
                  title: '',
                ) /*ListTile(
                  title: Row(children: [
                    Text(StringConvert.formatDuration(e.date_debut, e.date_fin,
                        e.heure_debut, e.heure_fin)),
                    const Icon(Icons.access_time_rounded),
                    Text(StringConvert.calculateDuration(
                        e.date_debut, e.date_fin, e.heure_debut, e.heure_fin))
                  ]),
                  subtitle: Text(e.nom),
                )*/
                )),
          ],
        ),
      ),
      floatingActionButton: MyFloatingActionButton( //Bouton ajout
          icon: Icons.add,
          key: const Key('add_event_btn'),
          onPressed: () {
            menuajoutevent();
          }),
    );
  }
}
