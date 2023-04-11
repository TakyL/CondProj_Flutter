import 'package:flutter_calendrier/outils/string_convert.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Removeleadingzero', ()
  {
    test('remoleadingzero actif ', () {
      String a = "1h15";
      final result = StringConvert.removeLeadingZero(a);
      expect(result,"1h15");
    });

    test('remoleadingzero non effectif ', () {
      String a = "01:15";
      final result = StringConvert.removeLeadingZero(a);
      expect(result,"1:15");
    });


  });

  group('formattimestring', ()
  {

    test('cas : Ajout 0 sur les heures  ', () {
      String a = "1:15";
      final result = StringConvert.formatTimeString(a);
      expect(result,"01h15");
    });

    test('cas : Ajout 0 sur les heures et minutes  ', () {
      String a = "1:5";
      final result = StringConvert.formatTimeString(a);
      expect(result,"01h05");
    });

    test('cas : Ajout 0 sur les minutes  ', () {
      String a = "14:5";
      final result = StringConvert.formatTimeString(a);
      expect(result,"14h05");
    });
  });

    group('calculateDuration', ()
    {

      test('calculateDuration : 1mns', () {
        String endDate = '16/02/2023';
        String startHour = '18:49';
        String endHour = '18:50';
        String startDate = '16/02/2023';
        final result = StringConvert.calculateDuration(
            startDate, endDate, startHour, endHour);
        expect(result, equals('00h01'));
      });

      test('calculateDuration : 10mns', () {
        String endDate = '16/02/2023';
        String startHour = '18:49';
        String endHour = '18:59';
        String startDate = '16/02/2023';
        final result = StringConvert.calculateDuration(
            startDate, endDate, startHour, endHour);
        expect(result, equals('00h10'));
      });

      test('calculateDuration : 15mns', () {
        String endDate = '16/02/2023';
        String startHour = '18:49';
        String endHour = '19:04';
        String startDate = '16/02/2023';
        final result = StringConvert.calculateDuration(
            startDate, endDate, startHour, endHour);
        expect(result, equals('00h15'));
      });


      test('calculateDuration : 1h', () {
        String endDate = '16/02/2023';
        String startHour = '16:50';
        String endHour = '17:50';
        String startDate = '16/02/2023';
        final result = StringConvert.calculateDuration(
            startDate, endDate, startHour, endHour);
        expect(result, equals('01h00'));
      });

      test('calculateDuration : 2h', () {
        String endDate = '16/02/2023';
        String startHour = '16:50';
        String endHour = '18:50';
        String startDate = '16/02/2023';
        final result = StringConvert.calculateDuration(
            startDate, endDate, startHour, endHour);
        expect(result, equals('02h00'));
      });



      test('calculateDuration : 5h12', () {
        String startDate = '16/02/2023';
        String endDate = '17/02/2023';
        String startHour = '18:49';
        String endHour = '00:01';

        final result = StringConvert.calculateDuration(
            startDate, endDate, startHour, endHour);
        expect(result, equals('05h12'));
      });

      test('calculateDuration :1j', () {
        String startDate = '16/02/2023';
        String endDate = '17/02/2023';
        String startHour = '18:49';
        String endHour = '18:49';

        final result = StringConvert.calculateDuration(
            startDate, endDate, startHour, endHour);
        expect(result, equals('24h00'));
      });

      test('calculateDuration : 2j', () {
        String startDate = '16/02/2023';
        String endDate = '18/02/2023';
        String startHour = '18:49';
        String endHour = '18:49';

        final result = StringConvert.calculateDuration(
            startDate, endDate, startHour, endHour);
        expect(result, equals('48h00'));
      });

      test('calculateDuration : 3j', () {
        String startDate = '16/02/2023';
        String endDate = '19/02/2023';
        String startHour = '18:49';
        String endHour = '18:49';

        final result = StringConvert.calculateDuration(
            startDate, endDate, startHour, endHour);
        expect(result, equals('72h00'));
      });



});
}