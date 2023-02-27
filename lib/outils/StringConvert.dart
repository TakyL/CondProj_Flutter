import 'package:intl/intl.dart';

class StringConvert
{
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
  static String formatDuration(
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
  static String getFrenchDay(String date) {
    DateTime dateTime = DateFormat('dd/MM/yyyy').parse(date);
    String dayOfWeek = DateFormat('EEEE', 'fr_FR').format(dateTime.toLocal());
    String capitalizedDayOfWeek =
        dayOfWeek.substring(0, 1).toUpperCase() + dayOfWeek.substring(1);
    return capitalizedDayOfWeek;
  }
}