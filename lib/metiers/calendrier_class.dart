// ignore_for_file: avoid_web_libraries_in_flutter

//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
//Pour le local

class Calendrier extends Widget {
  late int idUser;
  bool partage = false; //Liste d'id users si le calendrier est partagé
  late Set<int> tableauUser;
  CalendarFormat format = CalendarFormat.month;
  TableCalendar cal = TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.now(),
      lastDay: DateTime.now());
  //Autre solution remplacer par du static via defaultcalendrier mais problème avec les setstate
/**
 * Crée un widget TableCalender ayant par defaut non changeable la date de but
 * Dans un futur +- proche, il peut être envisé de faire un truc qui soit viable même après 2042
 */
  Calendrier(id, {partage = false}) {
    idUser = id;
    if (partage != false) {
      this.partage = true;
      tableauUser.add(id);
    }
    cal = defaultCalendrier();
  }

/**
 * Construit un widget tablecalendar 
 */
  TableCalendar defaultCalendrier() {
    return TableCalendar(
      locale: 'fr_Fr',
      firstDay: DateTime(2020),
      focusedDay: DateTime.now(),
      lastDay: DateTime(2042),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Mois',
        CalendarFormat.twoWeeks: '2 semaines',
        CalendarFormat.week: 'Semaine',
      },
      weekNumbersVisible: true,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarFormat: format,
      
    );
  }

  ///  Ajoute un utilisateur au calendrier partagé

  void ajoutUtilisateurCalendrier(int id) {
    if (partage) {
      tableauUser.add(id);
    } else {
      throw Exception("Ce calendrier n'est pas partagé ");
    }
  }

  
 
  /* onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                }); */

  void A(CalendarFormat _format) {
    format = _format;
  }
  
  
  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}
