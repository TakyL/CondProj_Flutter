import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'inter_ajoutevent.dart';
import 'classes/calendrier_class.dart';
import 'package:intl/date_symbol_data_local.dart'; //Pour le local

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
  //runApp(const MyApp());
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
      home: const MyHomePage(title: 'PlanIf'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedday = DateTime.now();
  DateTime focusedday = DateTime.now();
  CalendarFormat format = CalendarFormat.month;

  void menuajoutevent() //Push vers le menu d'ajout d'evenement
  {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Inter_Event()));
  }

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
              lastDay: DateTime(
                  2050), 
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
