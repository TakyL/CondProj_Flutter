

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendrier/outils/StringConvert.dart';
import 'package:table_calendar/table_calendar.dart';

import '../metiers/evenements_class.dart';
class EventListWidget extends StatefulWidget {
  final DateTime selectedDay;

  const EventListWidget({required this.selectedDay, Key? key}) : super(key: key);

  @override
  _EventListWidgetState createState() => _EventListWidgetState();
}
//FIXME: Brouillon du ..._getEventsFromMain
class _EventListWidgetState extends State<EventListWidget> {
  //late List<Evenement> _events;
  List<Evenement> _events = [];
  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final events = await _fetchEvents(widget.selectedDay);
    setState(() {
      _events = events;
    });
  }

  Future<List<Evenement>> _fetchEvents(DateTime day) async {
    // replace with your API call
    return [];
  }

  @override
  Widget build(BuildContext context) {
    if (_events == null) {
      return const CircularProgressIndicator();
    } else {
      return Column(
        children: _events.map((event) => Container(
          color: Colors.blue,
          child: ListTile(
            title: Row(children: [
              Text(StringConvert.formatDuration(event.date_debut, event.date_fin, event.heure_debut, event.heure_fin)),
              const Icon(Icons.access_time_rounded),
              Text(StringConvert.calculateDuration(event.date_debut, event.date_fin, event.heure_debut, event.heure_fin))
            ]),
            subtitle: Text(event.nom),
          ),
        )).toList(),
      );
    }
  }
}
