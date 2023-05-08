
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///
/// Classe qui regroupe les validators de l'interface d'ajout d'évenements
 class Validator_ajoutevent
{
  ///Verifie que le string est bien à un format date :dd/MM/yyyy
  static bool validateDateFormat(String value) {

    final date = DateFormat('dd/MM/yyyy').parse(value, true);

    if (date == null) {
      return false;
    }

    return true;
  }

  ///Vérifie que le string vérifie le format minutes suivant : HH:mm
  static bool validateTimeFormat(String value) {

    final time = TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(value, true));

    if (time == null) {
      return false;
    }

    return true;
  }

  ///Vérifie que la date de fin n'est pas avant la date de début
  static bool validateDatesFinAvantDebut(String startDate, String endDate) {


    final start = DateFormat('dd/MM/yyyy HH:mm').parse('$startDate 00:00', true);
    final end = DateFormat('dd/MM/yyyy HH:mm').parse('$endDate 00:00', true);

     return end.isBefore(start);

  }

  ///Vérifie que l'heure de fin n'est pas avant l'heure de début
  static bool validateHoursFinAvantDebut(String startHour, String endHour, String startDate, String endDate) {
    if (startHour.isEmpty || endHour.isEmpty || startDate.isEmpty || endDate.isEmpty) {
      return  false ;
    }

    final start = DateTime.parse('$startDate $startHour');
    final end = DateTime.parse('$endDate $endHour');

    if (start.isAtSameMomentAs(end) && end.isBefore(start)) {
      return false;
    }


    return true;
  }
}