import 'package:flutter_calendrier/outils/StringConvert.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

 // String durationString =
 // formatDuration(startDate, endDate, startHour, endHour);

  group('formatDuration', () {
    test('formatDuration : Jour identiques mais heures différentes', () {
      String endDate = '16/02/2023';
      String startHour = '16:50';
      String endHour = '18:50';
      String startDate = '16/02/2023';
      final result = StringConvert.formatDuration(
          startDate, endDate, startHour, endHour);
      expect(result, equals('02:00'));
    });
    test('formatDuration : Jour différents mais heures identiques', () {
      String endDate = '16/02/2023';
      String startHour = '16:50';
      String endHour = '16:50';
      String startDate = '17/02/2023';
      final result = StringConvert.formatDuration(
          startDate, endDate, startHour, endHour);
      expect(result, equals('24:00'));
    });

});
}