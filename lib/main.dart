import 'package:flutter/material.dart';
import 'package:flutter_calendrier/view/Connexion.dart';
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
import 'classes/firebase_auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_calendrier/db/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_calendrier/view/inter_registeruser.dart';
import 'package:flutter_calendrier/view/Inscription.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting().then((_) => runApp(const MyApp()));
  runApp(const MyApp());

  final FirebaseAuthService _auth = FirebaseAuthService();
  User? user =
      await _auth.signInWithEmailAndPassword("hugodip@orange.fr", "hugodipa");
  if (user != null) {
    //successfull login
    print("User successfully logged");
  } else {
    //unsuccessfull login
  }
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
        home: const MyHomePage(title: 'PlanIf'));
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
    db_event e = db_event();
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
      db_event liantdemo = db_event();
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
            heure_fin: e.heure_fin)
      ];
      db_event liantdemo = db_event();

      liantdemo.postDonneees(e);
      debugPrint("AJOUT");
    }

    //selectedevents[d].add(e);
  }

  //Return l'evenement du jour selectionné
  List<Evenement> _getEventsFromDay(DateTime d) {
    return selectedevents[d] ?? [];
  }

  /// Supprime le zéro initial d'une chaîne si présent.
  ///
  /// Si la chaîne d'entrée a une longueur de 2 et commence par '0',
  /// cette fonction renvoie une nouvelle chaîne avec le zéro initial supprimé.
  /// Sinon, la chaîne d'entrée est renvoyée inchangée.
  ///
  /// Exemple d'utilisation: removeLeadingZero('09') renvoie '9'
  static String removeLeadingZero(String str) {
    if (str.startsWith('0')) {
      return str.substring(1);
    }
    return str;
  }

  /// Calcule la durée entre deux dates et heures en minutes.
  ///
  /// À partir de deux chaînes de date et d'heure au format 'jj/mm/aaaa' et 'hh:mm',
  /// cette fonction calcule la durée entre elles en minutes.
  ///
  /// Si les deux dates sont identiques, la durée est calculée uniquement en fonction de l'heure.
  /// Sinon, la durée est calculée en fonction de la date et de l'heure.
  ///
  /// Exemple d'utilisation: calculateDuration('16/02/2023', '16:30', '16/02/2023', '18:00') renvoie 90
  static String calculateDuration(
      String startDate, String endDate, String startHour, String endHour) {
    // Parse the start and end dates
    DateTime startDateObj =
        DateTime.parse(startDate.split('/').reversed.join('-'));
    DateTime endDateObj = DateTime.parse(endDate.split('/').reversed.join('-'));

    // Parse the start and end hours
    List<String> startHourParts = startHour.split(':');
    int startHourInt = int.parse(startHourParts[0]);
    int startMinuteInt = int.parse(startHourParts[1]);

    List<String> endHourParts = endHour.split(':');
    int endHourInt = int.parse(endHourParts[0]);
    int endMinuteInt = int.parse(endHourParts[1]);

    // Calculate the duration in minutes
    int durationMinutes = 0;
    if (startDateObj == endDateObj) {
      durationMinutes =
          (endHourInt - startHourInt) * 60 + (endMinuteInt - startMinuteInt);
    } else {
      // Calculate the duration in minutes for the first and last day
      int firstDayMinutes = (23 - startHourInt) * 60 + (60 - startMinuteInt);
      int lastDayMinutes = endHourInt * 60 + endMinuteInt;

      // Calculate the duration in minutes for the full days in between
      int fullDaysMinutes = endDateObj.difference(startDateObj).inDays * 1440;

      durationMinutes = firstDayMinutes + lastDayMinutes + fullDaysMinutes;
    }

    // Format the duration as "hhhmm"
    int durationHours = durationMinutes ~/ 60;
    int durationMinutesRemainder = durationMinutes % 60;
    String durationHoursString = durationHours.toString();
    if (durationHoursString.length > 3) {
      durationHoursString = '999';
    }
    return removeLeadingZero(
        '${durationHoursString.padLeft(3, '0')}h${durationMinutesRemainder.toString().padLeft(2, '0')}');
  }

  /// Formate une durée sous la forme 'hh:mm'.
  ///
  /// À partir d'une durée en minutes, cette fonction renvoie une chaîne de caractères
  /// au format 'hh:mm'.
  ///
  /// Exemple d'utilisation: formatDuration(90) renvoie '01h30'
  String formatDuration(
      String startDate, String endDate, String startHour, String endHour) {

  DateTime startDateTime =
      DateFormat('dd/MM/yyyy HH:mm').parse('$startDate ${startHour.replaceAll('h', ':')}');
  DateTime endDateTime =
      DateFormat('dd/MM/yyyy HH:mm').parse('$endDate ${endHour.replaceAll('h', ':')}');


    String frenchStartDay = getFrenchDay(startDate);
    String frenchEndDay = getFrenchDay(endDate);

    String start =
        '$frenchStartDay ${startDateTime.day} ${removeLeadingZero(DateFormat('HH:mm').format(startDateTime))}';
    String end =
        '$frenchEndDay ${endDateTime.day} ${removeLeadingZero(DateFormat('HH:mm').format(endDateTime))}';

    if (startDate == endDate) {
      return '$start - ${removeLeadingZero(DateFormat('HH:mm').format(endDateTime))}';
    } else {
      return '$start - $end';
    }
  }

  /// Renvoie le jour de la semaine en français avec la première lettre en majuscule.
  ///
  /// À partir d'une chaîne de date au format 'jj/mm/aaaa', cette fonction
  /// analyse la date et la formatte pour renvoyer le jour de la semaine
  /// en français, avec la première lettre en majuscule.
  ///
  /// Exemple d'utilisation: getFrenchDay('16/02/2023') renvoie 'Jeudi'
  String getFrenchDay(String date) {
    DateTime dateTime = DateFormat('dd/MM/yyyy').parse(date);
    String dayOfWeek = DateFormat('EEEE', 'fr_FR').format(dateTime.toLocal());
    String capitalizedDayOfWeek =
        dayOfWeek.substring(0, 1).toUpperCase() + dayOfWeek.substring(1);
    return capitalizedDayOfWeek;
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
    String startDate = '16/02/2023';
    String endDate = '16/02/2023';
    String startHour = '16:50';
    String endHour = '18:50';
    String durationString =
        formatDuration(startDate, endDate, startHour, endHour);
    print(durationString);

    ///print(getFrenchDay("17/02/2022"));
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
            ..._getEventsFromDay(selectedday).map((Evenement e) {
              print(e.toString());

              return Container(
                  color: Colors.blueAccent,
                  child: ListTile(
                    title: Row(children: [
                      Text(formatDuration(e.date_debut, e.date_fin,
                          e.heure_debut, e.heure_fin)),
                      const Icon(Icons.access_time_rounded),
                      Text(calculateDuration(
                          e.date_debut, e.date_fin, e.heure_debut, e.heure_fin))
                    ]),
                    subtitle: Text(e.nom),
                  ));
            }),
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
