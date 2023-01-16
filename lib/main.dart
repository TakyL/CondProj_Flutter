import 'package:flutter/material.dart';
import 'package:flutter_calendrier/db/database_evenement.dart';
import 'package:flutter_calendrier/db/database_interface.dart';
import 'package:table_calendar/table_calendar.dart';
import 'view/inter_ajoutevent.dart';
import 'classes/calendrier_class.dart';
import 'classes/evenements_class.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'int/fr.dart';
import 'classes/priorité_class.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_calendrier/db/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting().then((_) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calendrier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*   localizationsDelegates: [
    GlobalMaterialLocalizations.delegates
  //  GlobalWidgetsLocalizations.delegate,
  //  GlobalCupertinoLocalizations.delegate,
  ],supportedLocales: [
    const Locale('en'),
    const Locale('fr')
  ]
  ,*/
      home: const MyHomePage(title: 'PlanIf'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title; //Nom du calendrier
  //On pourra avoir la liste des evenements => selectedevents
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  void fas(DatabaseReference ref) async {
    db_event e = db_event(db: ref);
    e.getDonnees();
   // e.getDonneesById(3);
  }

  DateTime selectedday = DateTime.now();
  DateTime focusedday = DateTime.now();
  CalendarFormat format = CalendarFormat.month;

  late Map<DateTime, List<Evenement>> selectedevents;

  void menuajoutevent() //Push vers le menu d'ajout d'evenement
  {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Inter_Event(
                time: focusedday, callback: AjouteEventtocetteputaineliste)));
  }

  void AjouteEventtocetteputaineliste(DateTime d, Evenement e) {
    //Le callback à rename quand ça sera fini
    if (selectedevents[d] != null) {
      selectedevents[d]?.add(e); //Peut poser problème
      db_event liantdemo = db_event(
          db: ref); //Note pas sur que mettre un argument database soit un truc utile, on peut le faire localement à reflechir todo
      liantdemo.postDonneees(e);
    } else {
      selectedevents[d] = [
        Evenement.n(nom: e.nom)
      ]; 
            db_event liantdemo = db_event(
          db: ref); //Note pas sur que mettre un argument database soit un truc utile, on peut le faire localement à reflechir todo
      liantdemo.postDonneees(e);
      debugPrint("AJOUT");
    }

    //selectedevents[d].add(e);
  }

  List<Evenement> _getEventsFromDay(DateTime d) {
    return selectedevents[d] ?? []; 
  }

  List<prioriete> listp = <prioriete>[];
/**
 * Permet de changer le jour selectionne
 
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
  if (!isSameDay(_selectedDay, selectedDay)) {
    setState(() {
      _focusedDay = focusedDay;
      _selectedDay = selectedDay;
      _selectedEvents = _getEventsForDay(selectedDay);
    });
  }
}*/

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    selectedevents = {};
    super.initState();
    fas(ref);
  }

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
            TableCalendar(
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
            ..._getEventsFromDay(selectedday).map((Evenement e) => Container(
              color: Colors.blueAccent, 
              child:ListTile(
                  title: Text(e.nom),
                ))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Ajouter un evenement au calendrier
        onPressed: menuajoutevent,
        tooltip: 'Ajouter un évenement',
        child: const Icon(Icons.add),
      ),
    );
  }
}
