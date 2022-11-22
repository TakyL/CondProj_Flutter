import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'inter_ajoutevent.dart';

void main() {
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
/*
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  void menuajoutevent() //Push vers le menu d'ajout d'evenement
  {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Inter_Event()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
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
