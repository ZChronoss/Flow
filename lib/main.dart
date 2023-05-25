import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const Calendar());
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(32, 33, 36, 1)
      ),
      home: Scaffold(
        body: content(),
      ),
    );
  }

  Widget content(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 390
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(57, 57, 57, 1),
        ),
        child: 
          TableCalendar(
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                color: Colors.white
              ),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Color.fromRGBO(183, 183, 183, 1)
              ),
              weekendStyle: TextStyle(
                color: Color.fromRGBO(183, 183, 183, 1)
              )
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            firstDay: DateTime(2010),
            focusedDay: today,
            lastDay: DateTime(2050),
            onDaySelected:_onDaySelected,
            calendarStyle: const CalendarStyle(
              defaultTextStyle: TextStyle(
                color: Colors.white
              ),
              weekendTextStyle: TextStyle(
                color: Colors.white
              ),
            ),
          ),
      )
    );
  }
}

