import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Widget_TableCalendar extends StatefulWidget {
  const Widget_TableCalendar({Key? key}) : super(key: key);

  @override
  _Widget_TableCalendarState createState() => _Widget_TableCalendarState();
}

class _Widget_TableCalendarState extends State<Widget_TableCalendar> {
  DateTime focusedday = DateTime.now();
  DateTime selectedday = DateTime.now();
  CalendarFormat format = CalendarFormat.month;

  void _onFormatChanged(CalendarFormat _format) {
    setState(() {
      format = _format;
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedday = selectedDay;
      focusedday = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'fr_FR',
      focusedDay: focusedday,
      firstDay: DateTime(2020),
      lastDay: DateTime(2050),
      calendarFormat: format,
      onFormatChanged: _onFormatChanged,
      onDaySelected: _onDaySelected,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Mois',
        CalendarFormat.twoWeeks: '2 semaines',
        CalendarFormat.week: 'Semaine',
      },
      weekNumbersVisible: true,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.rectangle,
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
        todayDecoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          shape: BoxShape.rectangle,
        ),
      ),
      selectedDayPredicate: (DateTime date) {
        return isSameDay(selectedday, date);
      },
    );
  }
}